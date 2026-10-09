import 'dart:async';
import 'dart:io';

import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/source/network/video_api.dart';
import 'package:application/features/player/data/model/player_props.dart';
import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:application/features/player/data/services/dowload_hls.dart';
import 'package:application/features/player/data/source/local/timeline.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_caching/flutter_video_caching.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:mpris_service/mpris_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum PlayerStatus { empty, init, error, paid }

class PlayerController {
  final Timeline timeline;
  final VideoApi videoApi;
  PlayerController(this.videoApi, this.timeline);

  final _isBuffering = signal(false);
  final _isFullscreen = signal(false);
  final _isMuted = signal(false);
  final _isPaused = signal(false);
  final _hasIntro = signal(false);
  final _progress = signal(Duration.zero);
  final _buffer = signal(Duration.zero);
  final _duration = signal(Duration.zero);
  final _errorMessage = signal("");
  final _playerStatus = signal(PlayerStatus.empty);
  final _playerFit = signal(BoxFit.cover);
  final _volume = signal(0.0);
  final _skipPosition = signal(<int>[]);
  final _mediaType = signal(MediaType.serie);
  final _tracks = signal<Tracks?>(null);
  final _videoTrack = signal<VideoTrack?>(null);
  final _currentStream = signal<MediaStream?>(null);
  final _offset = signal(0);
  final _totalEpisodes = signal(0);

  bool get isBuffering => _isBuffering.value;
  bool get isFullscreen => _isFullscreen.value;
  bool get isMuted => _isMuted.value;
  bool get isPaused => _isPaused.value;
  bool get hasIntro => _hasIntro.value;
  int get offset => _offset.value;
  int get total => _totalEpisodes.value;
  double get volume => _volume.value;
  Duration get progress => _progress.value;
  Duration get buffer => _buffer.value;
  Duration get duration => _duration.value;
  MediaType get mediaType => _mediaType.value;
  String get errorMessage => _errorMessage.value;
  PlayerStatus get status => _playerStatus.value;
  MediaStream? get stream => _currentStream.value;
  FlutterSignal<BoxFit> get playerFit => _playerFit;

  Tracks? get tracks => _tracks.value;
  VideoTrack? get videoTrack => _videoTrack.value;

  // end of states;

  final controllerConfig = const VideoControllerConfiguration(enableHardwareAcceleration: true, hwdec: 'auto');
  final playerConfig = const PlayerConfiguration(
    async: true,
    bufferSize: 64 * 1024 * 1024,
    osc: false,
    pitch: false,
    libass: false,
    title: "Anibla.uz",
  );
  late final player = Player(configuration: playerConfig);
  late final controller = VideoController(player, configuration: controllerConfig);
  final List<StreamSubscription> subscriptions = [];
  MPRIS? mpris;
  bool _isSubscribed = false;
  String? animeId;

  String? _loadingUrl;

  Future init(MediaStream stream) async {
    if (stream.url.isEmpty) return _playerStatus.set(.paid);

    final current = _currentStream.value;
    final streamUrl = stream.url;
    final oldStreamUrl = current?.url ?? "";

    if (streamUrl == oldStreamUrl || streamUrl == _loadingUrl) return;
    _loadingUrl = streamUrl;

    try {
      await _notify();
      _subscribeStreams();
      if (current != null) await saveTimeline();

      final video = (await videoApi.getVideo(streamUrl.replaceFirst("/anibla.uz/", "/media.anibla.uz/"))).data;
      final master = await DownloadHlsPlaylist.downloadMasterPlaylist(
        video.file.replaceFirst("/anibla.uz/", "/media.anibla.uz/"),
        streamUrl.trim(),
      );
      final skip = video.skip.split("-").map((i) => i.tryParseInt() ?? 0).toList();
      final oldPath = player.state.playlist.medias.firstOrNull?.uri.toOriginUrl();
      final path = master.variants[2].downloadUrl;
      if (path == oldPath) return;

      _isBuffering.set(true);
      _skipPosition.set(skip);
      _playerStatus.set(.init);
      _mediaType.set(stream.type);
      _totalEpisodes.set(stream.totalEpisodes);
      _offset.set(stream.episode);

      await player.open(Media(path.toLocalUrl()), play: false);
    } catch (e) {
      _errorMessage.set(e.toString());
    } finally {
      _currentStream.set(stream); // listener re-enters here, guard blocks it
      _loadingUrl = null; // clear AFTER set
    }
  }

  Future<void> precache(String url, [bool download = true]) async {
    // final video = await videoApi.getVideo(url);
    // await VideoCaching.precache(video.data.file, downloadNow: download, cacheSegments: 5);
  }

  Future<void> reload() async {
    final s = _currentStream.value;
    if (s == null) return;
    await init(s);
  }

  Future<void> _notify() async {
    if (Platform.isLinux) {
      await mpris?.dispose();
      mpris = await MPRIS.create(busName: "org.mpris.MediaPlayer2.anibla", identity: "Anibla.uz", desktopEntry: "anibla");
      mpris!.setEventHandler(
        MPRISEventHandler(
          playPause: togglePlay,
          play: play,
          pause: pause,
          seek: seek,
          volume: setVolume,
          setPosition: (trackId, position) async => seek(Duration(microseconds: position)),
        ),
      );
    }
  }

  void _pushMprisMetadata(Duration length) {
    final info = _currentStream.value;
    if (mpris == null || info == null) return;
    mpris!
      ..metadata = MPRISMetadata(
        Uri.parse(info.url),
        artUrl: Uri.parse(info.cover),
        length: length,
        title: "${info.episode}. ${info.episodeTitle}",
        artist: [info.animeTitle],
      )
      ..playbackStatus = MPRISPlaybackStatus.playing
      ..canSetFullscreen = false
      ..canPlay = true
      ..canPause = true
      ..canSeek = true
      ..canControl = true
      ..canGoNext = false
      ..canGoPrevious = false;
  }

  void _subscribeStreams() {
    if (_isSubscribed) return;
    _isSubscribed = true;
    subscriptions.addAll([
      player.stream.track.distinct().listen((event) => _videoTrack.set(event.video)),
      player.stream.tracks.distinct().listen((event) => _tracks.set(event)),
      player.stream.buffering.distinct().listen((event) => _isBuffering.set(event)),
      player.stream.playing.distinct().listen((event) => _isPaused.set(!event)),
      player.stream.volume.distinct().listen((event) => (_isMuted.set(event == 0), _volume.set(event))),
      player.stream.playlist.distinct().listen((event) => setOldTimeline()),
      player.stream.error.distinct().listen((event) => (_playerStatus.set(.error), _errorMessage.set(event))),
      player.stream.duration.distinct().listen((event) {
        if (event > Duration.zero && Platform.isLinux) _pushMprisMetadata(event);
        _duration.set(event);
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
    final skip = _skipPosition.value;
    final hasSkip = skip.isNotEmpty;
    final hasIntro = hasSkip ? (time.inSeconds < skip.last && time.inSeconds > skip.first) : false;

    mpris?.position = time;
    _progress.value = time;
    _buffer.value = buffer;
    _hasIntro.value = hasIntro;
  }

  Future<void> setOldTimeline([String? fileUrl]) async {
    final url = fileUrl ?? _currentStream.value?.url;
    if (url == null) return;
    final time = timeline.getTimeline(url);
    if (time != null) {
      await player.stream.duration
          .firstWhere((d) => d.inSeconds > 0)
          .timeout(const Duration(seconds: 10), onTimeout: () => Duration.zero);
      await seek(time.progress);
    }
  }

  Future<void> saveTimeline([Duration? time]) async {
    final adjusted = (time ?? player.state.position) - const Duration(seconds: 3);
    final safeProgress = adjusted.isNegative ? Duration.zero : adjusted;
    await timeline.saveTimeline(_currentStream.value!.url, TimelineModel(progress: safeProgress, duration: _duration.value));
  }

  Future<void> skipIntro() async {
    if (_skipPosition.isEmpty) return;
    await player.seek(Duration(seconds: _skipPosition.value.last));
  }

  Future<void> toggleFullscreen(BuildContext context) async {
    if (_isFullscreen.value) {
      _isFullscreen.value = false;
      await Utils.exitFullScreen();
    } else {
      _isFullscreen.value = true;
      await Utils.enterFullScreen();
    }
  }

  Future<void> skip(Duration step) async {
    final current = player.state.position;
    final time = (current + step).clamp(Duration(seconds: 0), _duration.value);
    seek(time);
  }

  Future<void> seek(Duration time) async {
    await player.seek(time);
    await saveTimeline(time);
    mpris?.position = time;
  }

  Future<void> toggleMute() async => player.state.volume == 0 ? setVolume(_volume.value) : mute();
  Future<void> mute() async => await player.setVolume(0);
  Future<void> setVolume(double volume) async => await player.setVolume(volume.clamp(0, 100).toDouble());
  Future<void> upVolume() async => await setVolume(_volume.value + 10);
  Future<void> downVolume() async => await setVolume(_volume.value - 10);
  Future<void> play() async {
    mpris?.playbackStatus = MPRISPlaybackStatus.playing;
    await player.play();
  }

  Future<void> pause() async {
    mpris?.playbackStatus = MPRISPlaybackStatus.paused;
    await player.pause();
  }

  void closeError() => _playerStatus.set(.init);
  Future<void> togglePlay() async => player.state.playing ? await pause() : await play();
  Future<void> setResolution(VideoTrack track) async => await player.setVideoTrack(track);
  Future<void> setAudio(AudioTrack track) async => await player.setAudioTrack(track);
  void setFit(BoxFit fit) => _playerFit.set(fit);
  void toggleFit() => switch (_playerFit.value) {
    BoxFit.contain => setFit(BoxFit.cover),
    BoxFit.cover => setFit(BoxFit.fill),
    _ => setFit(BoxFit.contain),
  };

  Future<void> dispose() async {
    for (var sub in subscriptions) {
      await sub.cancel();
    }
    await Utils.exitFullScreen();
    await saveTimeline();
    await mpris?.dispose();
    await player.dispose().catchError((_) {});
  }
}
