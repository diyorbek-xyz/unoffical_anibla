import 'dart:async';
import 'package:application/core/utils/base_url.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/animes/data/mapper/video_mapper.dart';
import 'package:application/features/animes/data/source/remote/video_api.dart';
import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:application/features/player/data/source/local/timeline.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/pages/player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:mpris_service/mpris_service.dart';
import 'package:rxdart/rxdart.dart';

class PlayerController extends Cubit<PlayerStates> {
  final Timeline timeline;
  final VideoApi videoApi;
  PlayerController(this.timeline, this.videoApi) : super(PlayerStates.empty());

  final player = Player(
    configuration: const PlayerConfiguration(
      async: true,
      bufferSize: 8 * 1024 * 1024,
      osc: false,
      pitch: false,
      libass: false,
      logLevel: MPVLogLevel.error,
      title: "Anibla.uz",
    ),
  );
  late final controller = VideoController(player, configuration: VideoControllerConfiguration(enableHardwareAcceleration: true, hwdec: 'auto'));
  final List<StreamSubscription> subscription = [];
  late final MPRIS mpris;
  ({Uri uri, Uri art, String title, List<String> artist})? _mediaInfo;

  Future<void> init(PlayerProps props) async {
    if (isClosed) return;
    mpris = await MPRIS.create(busName: "org.mpris.MediaPlayer2.anibla", identity: "Anibla.uz", desktopEntry: "");
    mpris.setEventHandler(MPRISEventHandler(playPause: togglePlay, play: play, pause: pause, seek: seek, volume: setVolume));

    _subscribeStreams();
    await openStream(props);
  }

  void _pushMprisMetadata(Duration length) {
    final info = _mediaInfo;
    if (info == null) return;
    mpris.metadata = MPRISMetadata(info.uri, artUrl: info.art, length: length, title: info.title, artist: info.artist);
    mpris
      ..playbackStatus = MPRISPlaybackStatus.playing
      ..canPlay = true
      ..canPause = true
      ..canSeek = true
      ..canControl = true
      ..canGoNext = false
      ..canGoPrevious = false;
  }

  void _subscribeStreams() {
    subscription.addAll([
      player.stream.track.listen((event) => emit(state.copyWith(videoTrack: event.video))),
      player.stream.tracks.listen((event) => emit(state.copyWith(tracks: event))),
      player.stream.buffering.distinct().listen((event) => emit(state.copyWith(isBuffering: event))),
      player.stream.playing.listen((event) => emit(state.copyWith(isPaused: !event))),
      player.stream.volume.listen((event) => emit(state.copyWith(isMuted: event == 0))),
      player.stream.playlist.listen((event) => setOldTimeline()),
      player.stream.error.listen(
        (event) => emit(
          state.copyWith(hasError: true, error: event.contains("https") ? event.replaceRange(event.indexOf("https"), null, "[URL hidden]") : event),
        ),
      ),
      player.stream.duration.distinct().listen((event) {
        if (event > Duration.zero) _pushMprisMetadata(event);
        emit(state.copyWith(duration: event));
      }),
      Rx.combineLatest2(
        player.stream.position,
        player.stream.buffer,
        (a, b) => (a, b),
      ).sampleTime(Durations.extralong4).distinct().listen(_positionStream),
    ]);
  }

  void _positionStream((Duration, Duration) progress) {
    final (time, buffer) = progress;
    final hasSkip = state.skip.isNotEmpty;
    final hasIntro = hasSkip ? (time.inSeconds < state.skip.last && time.inSeconds > state.skip.first) : false;
    mpris.position = time;
    emit(state.copyWith(progress: time, buffer: buffer, hasIntro: hasIntro));
  }

  Future<void> setOldTimeline([String? streamId]) async {
    final time = timeline.getTimeline(streamId ?? state.streamId);
    if (time != null) {
      await player.stream.duration.firstWhere((d) => d.inSeconds > 0).timeout(const Duration(seconds: 10), onTimeout: () => Duration.zero);
      await seek(time.progress);
    }
  }

  Future<void> saveTimeline([Duration? time]) async {
    final adjusted = (time ?? player.state.position) - const Duration(seconds: 3);
    final safeProgress = adjusted.isNegative ? Duration.zero : adjusted;
    await timeline.saveTimeline(state.streamId, TimelineModel(progress: safeProgress, duration: state.duration));
  }

  Future<void> skipIntro() async {
    if (state.skip.isEmpty) return;
    await player.seek(Duration(seconds: state.skip.last));
  }

  Future<void> openStream(PlayerProps props) async {
    if (props.stream.isEmpty) return emit(state.copyWith(error: "paid", hasError: true));
    final streamId = getStreamId(props.stream);
    final oldStreamId = getStreamId(state.streamId);
    if (streamId == oldStreamId && oldStreamId.isNotEmpty && !state.hasError) return;
    if (state.streamId.isNotEmpty) await saveTimeline();

    final response = await videoApi.getVideo(streamId);
    final video = VideoMapper.modelToEntity(response.data);
    final skip = (video.skip as String?)?.split("-").map((e) => e.parseInt()).toList() ?? [];
    final currentVideo = player.state.playlist.medias.firstOrNull?.uri;
    if (currentVideo == video.file) {
      return emit(state.copyWith(hasError: false, error: "init"));
    }
    emit(
      state.copyWith(
        anime: props.anime,
        title: props.title,
        skip: skip,
        hasError: false,
        error: "init",
        isBuffering: true,
        streamId: streamId,
        type: props.type,
        position: props.position,
        isPaused: true,
      ),
    );
    _mediaInfo = (uri: Uri.parse(video.file), art: Uri.parse(addBaseUrl(props.cover)), title: "${props.title}-qism", artist: [props.anime]);
    await player.open(Media(video.file), play: false);
  }

  Future<void> toggleFullscreen(BuildContext context) async {
    if (state.isFullscreen) {
      emit(state.copyWith(isFullscreen: false));
      Navigator.pop(context);
      await Utils.exitFullScreen();
    } else {
      emit(state.copyWith(isFullscreen: true));
      final controller = context.read<PlayerController>();
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (_, _, _) => BlocProvider.value(value: controller, child: PlayerPage()),
          transitionsBuilder: (_, animation, _, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
      await Utils.enterFullScreen();
    }
  }

  Future<void> skip(Duration step) async {
    final current = player.state.position;
    final time = (current + step).clamp(Duration(seconds: 0), state.duration);
    seek(time);
  }

  Future<void> seek(Duration time) async {
    print(time);
    emit(state.copyWith(progress: time));
    await player.seek(time);
    await saveTimeline(time);
    mpris.position = time;
  }

  Future<void> toggleMute() async {
    if (player.state.volume == 0) {
      setVolume(state.volume);
    } else {
      mute();
    }
  }

  Future<void> mute() async {
    emit(state.copyWith(isMuted: true));
    await player.setVolume(0);
  }

  Future<void> setVolume(double volume) async {
    final vol = volume.clamp(0, 100).toDouble();
    emit(state.copyWith(isMuted: vol == 0, volume: vol));
    await player.setVolume(vol);
  }

  Future<void> upVolume() async {
    await setVolume(state.volume + 10);
  }

  Future<void> downVolume() async {
    await setVolume(state.volume - 10);
  }

  Future<void> play() async {
    emit(state.copyWith(isPaused: false));
    mpris.playbackStatus = MPRISPlaybackStatus.playing;
    await player.play();
  }

  Future<void> pause() async {
    emit(state.copyWith(isPaused: true));
    mpris.playbackStatus = MPRISPlaybackStatus.paused;
    await player.pause();
  }

  Future<void> togglePlay() async {
    if (player.state.playing) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> setResolution(VideoTrack track) async {
    emit(state.copyWith(videoTrack: track));
    await player.setVideoTrack(track);
  }

  Future<void> setAudio(AudioTrack track) async {
    await player.setAudioTrack(track);
  }

  void setFit(BoxFit fit) {
    emit(state.copyWith(fit: fit));
  }

  void toggleFit() {
    switch (state.fit) {
      case BoxFit.contain:
        setFit(BoxFit.cover);
      case BoxFit.cover:
        setFit(BoxFit.fill);
      case BoxFit.fill:
      default:
        setFit(BoxFit.contain);
    }
  }

  @override
  void emit(PlayerStates state) {
    if (!isClosed) super.emit(state);
  }

  @override
  Future<void> close() async {
    if (isClosed) return;
    for (var sub in subscription) {
      await sub.cancel();
    }
    emit(PlayerStates.empty());
    await Utils.exitFullScreen();
    await saveTimeline();
    await mpris.dispose();
    try {
      await player.dispose();
    } catch (_) {}
    super.close();
  }
}
