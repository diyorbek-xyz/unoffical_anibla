import 'dart:async';
import 'package:application/core/utils/base_url.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/animes/data/mapper/video_mapper.dart';
import 'package:application/features/animes/data/source/remote/video_api.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/player/data/model/timeline_model.dart';
import 'package:application/features/player/data/source/local/timeline.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/pages/player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';

class PlayerController extends Cubit<PlayerStates> {
  final Timeline timeline;
  final VideoApi videoApi;
  PlayerController(this.timeline, this.videoApi) : super(PlayerStates.empty());

  bool _isSeeking = false;

  final player = Player(
    configuration: PlayerConfiguration(osc: false, async: false),
  );
  late final controller = VideoController(player);

  Future<void> init(List<EpisodeEntity> episodes) async {
    final isLast = episodes.length == 1;
    await player.setPlaylistMode(PlaylistMode.none);
    final skip = await openEpisode(episodes.first);
    await setOldTimeline();
    await Utils.exitFullScreen();

    emit(
      PlayerStates(
        seekProgress: Duration.zero,
        fit: BoxFit.contain,
        error: "init",
        hasError: false,
        skip: skip ?? [],
        isFirst: true,
        isLast: isLast,
        hasIntro: false,
        videoTrack: player.state.track.video,
        tracks: player.state.tracks,
        buffering: true,
        duration: player.state.duration,
        episode: episodes.first,
        episodes: episodes,
        isFullscreen: false,
        isMuted: player.state.volume == 0,
        isPaused: !player.state.playing,
        volume: player.state.volume,
        bufferStream: player.stream.buffer,
        progressStream: player.stream.position,
      ),
    );

    player.stream.track.listen(
      (event) => emit(state.copyWith(videoTrack: event.video)),
    );
    player.stream.tracks.listen((event) => emit(state.copyWith(tracks: event)));
    player.stream.duration.listen(
      (event) => emit(state.copyWith(duration: event)),
    );
    player.stream.buffering.listen(
      (event) => emit(state.copyWith(buffering: event)),
    );
    player.stream.playing.listen(
      (event) => emit(state.copyWith(isPaused: !event)),
    );
    player.stream.volume.listen(
      (event) => emit(state.copyWith(isMuted: event == 0)),
    );
    player.stream.playlist.listen((event) async {
      await setOldTimeline();
    });
    player.stream.position.listen((event) async {
      if (_isSeeking) return;
      final hasSkip = state.skip.isNotEmpty;
      final hasIntro = hasSkip
          ? (event.inSeconds < state.skip.last &&
                event.inSeconds > state.skip.first)
          : false;
      if (hasIntro != state.hasIntro) {
        emit(state.copyWith(hasIntro: hasIntro));
      }
    });
    player.stream.error.listen(
      (event) => emit(
        state.copyWith(
          hasError: true,
          error: event.replaceRange(event.indexOf("https"), null, "Video"),
        ),
      ),
    );
  }

  Future<void> setOldTimeline() async {
    final time = timeline.getTimeline(state.episode.id);
    if (time != null) {
      await player.stream.duration.firstWhere(
        (element) => element.inSeconds > 0,
      );
      await seek(time.progress);
    }
  }

  Future<void> saveTimeline([Duration? time]) async {
    await timeline.saveTimeline(
      state.episode.id,
      TimelineModel(
        progress: (time ?? player.state.position) - Duration(seconds: 3),
        duration: state.duration,
      ),
    );
  }

  Future<void> skipIntro() async {
    if (state.skip.isEmpty) return;
    await player.seek(Duration(seconds: state.skip.last));
  }

  Future<List<int>?> openEpisode(EpisodeEntity episode) async {
    PlayerStates current = state.copyWith(episode: episode);
    if (episode.video.isEmpty) {
      emit(
        current.copyWith(
          hasError: true,
          error: "Bu qismni ko'rish uchun obuna sotib oling",
        ),
      );
      return null;
    }
    if (state.episode.id == episode.id || episode.video.isEmpty) return null;
    if (state.episode.id.isNotEmpty) await saveTimeline();

    final response = await videoApi.getVideo(getStreamId(episode.video));
    final video = VideoMapper.modelToEntity(response.data);
    final skip =
        (video.skip as String?)?.split("-").map((e) => e.parseInt()).toList() ??
        [];
    if (video.file.isEmpty) return null;
    final index = state.episodes.indexWhere(
      (element) => episode.episodeNumber == element.episodeNumber,
    );
    final isLast = index == state.episodes.length - 1;
    final isFirst = index == 0;

    emit(current.copyWith(skip: skip, isFirst: isFirst, isLast: isLast));

    await player.open(Media(video.file), play: false);
    return skip;
  }

  Future<void> previousEpisode() async {
    if (state.episode.episodeNumber == 1) return;
    final prev = state.episodes.singleWhere(
      (element) => element.episodeNumber == state.episode.episodeNumber - 1,
    );
    await openEpisode(prev);
  }

  Future<void> nextEpisode() async {
    if (state.episode.episodeNumber == state.episodes.length) return;
    final prev = state.episodes.firstWhere(
      (element) => element.episodeNumber == state.episode.episodeNumber + 1,
    );
    await openEpisode(prev);
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
          pageBuilder: (_, _, _) =>
              BlocProvider.value(value: controller, child: PlayerPage()),
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
    emit(state.copyWith(seekProgress: time));
    _isSeeking = true;
    await player.seek(time);
    _isSeeking = false;
    await saveTimeline(time);
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
    await player.play();
  }

  Future<void> pause() async {
    emit(state.copyWith(isPaused: true));
    await player.pause();
  }

  Future<void> togglePlay() async {
    emit(state.copyWith(isPaused: !player.state.playing));
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
  Future<void> close() async {
    await saveTimeline();
    await player.dispose();
    await Utils.exitFullScreen();
    emit(PlayerStates.empty());
    return super.close();
  }
}
