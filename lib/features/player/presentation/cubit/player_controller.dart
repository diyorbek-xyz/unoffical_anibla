import 'dart:async';
import 'dart:io';
import 'package:application/core/utils/base_url.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/animes/data/mapper/video_mapper.dart';
import 'package:application/features/animes/data/source/remote/video_api.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/pages/player_page.dart';
import 'package:application/features/player/presentation/widgets/video_player.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:window_manager/window_manager.dart';

class PlayerController extends Cubit<PlayerStates> {
  PlayerController() : super(PlayerStates.empty());

  bool _isSeeking = false;

  final player = Player();
  late final controller = VideoController(player);

  Future<void> init(List<EpisodeEntity> episodes) async {
    final isLast = episodes.length == 1;
    final skip = await openEpisode(episodes.first);
    await windowManager.setFullScreen(false);

    emit(
      PlayerStates(
        error: "init",
        hasError: false,
        skip: skip ?? [],
        isFirst: true,
        isLast: isLast,
        hasIntro: false,
        videoTrack: player.state.track.video,
        tracks: player.state.tracks,
        buffer: player.state.buffer,
        buffering: true,
        duration: player.state.duration,
        episode: episodes.first,
        episodes: episodes,
        isFullscreen: false,
        isMuted: player.state.volume == 0,
        isPaused: !player.state.playing,
        time: player.state.position,
        volume: player.state.volume,
      ),
    );
    player.stream.error.listen((event) {
      emit(
        state.copyWith(
          hasError: true,
          error: event.replaceRange(event.indexOf("https"), null, "Video"),
        ),
      );
    });
    player.stream.track.listen((event) {
      emit(state.copyWith(videoTrack: event.video));
    });
    player.stream.tracks.listen((event) {
      emit(state.copyWith(tracks: event));
    });
    player.stream.duration.listen((event) {
      emit(state.copyWith(duration: event));
    });
    player.stream.buffering.listen((event) {
      emit(state.copyWith(buffering: event));
    });
    player.stream.buffer.listen((event) {
      emit(state.copyWith(buffer: event));
    });
    player.stream.playing.listen((event) {
      emit(state.copyWith(isPaused: !event));
    });
    player.stream.volume.listen((event) {
      emit(state.copyWith(isMuted: event == 0));
    });
    player.stream.position.listen((event) {
      if ((event - state.time).abs() < Duration(seconds: 1) || _isSeeking) return;
      final hasSkip = state.skip.isNotEmpty;
      final hasIntro = hasSkip
          ? (event.inSeconds < state.skip.last && event.inSeconds > state.skip.first)
          : false;
      emit(state.copyWith(time: event, hasIntro: hasIntro));
    });
  }

  Future<void> skipIntro() async {
    if (state.skip.isEmpty) return;
    await player.seek(Duration(seconds: state.skip.last));
  }

  Future<List<int>?> openEpisode(EpisodeEntity episode) async {
    if (state.episode.id == episode.id || episode.video.isEmpty) return null;
    final response = await sl<VideoApi>().getVideo(getStreamId(episode.video));
    final video = VideoMapper.modelToEntity(response.data);
    final skip = (video.skip as String?)?.split("-").map((e) => e.parseInt()).toList() ?? [];
    if (video.file.isEmpty) return null;
    final index = state.episodes.indexWhere(
      (element) => episode.episodeNumber == element.episodeNumber,
    );
    final isLast = index == state.episodes.length - 1;
    final isFirst = index == 0;

    emit(state.copyWith(episode: episode, skip: skip, isFirst: isFirst, isLast: isLast));

    player.open(Media(video.file));
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

  Future<void> toggleFullscreen(BuildContext context, VideoPlayer player) async {
    final isFullscreen = await windowManager.isFullScreen();
    if (isFullscreen) {
      emit(state.copyWith(isFullscreen: false));
      Navigator.pop(context);
      if (Platform.isAndroid || Platform.isIOS) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      } else {
        await windowManager.setFullScreen(false);
      }
    } else {
      final controller = context.read<PlayerController>();
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (_, _, _) => BlocProvider.value(
            value: controller,
            child: PlayerPage(player: player),
          ),
          transitionsBuilder: (_, animation, _, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
      if (Platform.isAndroid || Platform.isIOS) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        await windowManager.setFullScreen(true);
      }
      emit(state.copyWith(isFullscreen: true));
    }
  }

  Future<void> skip(Duration step) async {
    seek((state.time + step).clamp(Duration(seconds: 0), state.duration));
  }

  Future<void> seek(Duration time) async {
    _isSeeking = true;
    emit(state.copyWith(time: time));
    await player.seek(time);
    _isSeeking = false;
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
    player.setVideoTrack(track);
  }

  @override
  Future<void> close() async {
    await player.dispose();
    await windowManager.setFullScreen(false);
    emit(PlayerStates.empty());
    return super.close();
  }
}
