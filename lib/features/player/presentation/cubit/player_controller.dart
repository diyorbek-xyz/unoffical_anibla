import 'dart:async';
import 'dart:io';

import 'package:application/features/animes/presentation/widgets/video_player.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/pages/player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:window_manager/window_manager.dart';

class PlayerController extends Cubit<PlayerStates> {
  PlayerController({required this.playlist}) : super(PlayerInitial());

  final Playlist playlist;
  bool _isSeeking = false;

  final player = Player();
  late final controller = VideoController(player);

  void init() async {
    await player.open(playlist, play: false);
    player.setPlaylistMode(PlaylistMode.single);
    windowManager.setFullScreen(false);
    emit(
      PlayerReady(
        videoTrack: player.state.track.video,
        tracks: player.state.tracks,
        playlist: player.state.playlist,
        currentMedia: playlist.medias.elementAt(playlist.index),
        buffer: player.state.buffer,
        buffering: true,
        duration: player.state.duration,
        episode: null,
        isFullscreen: false,
        isMuted: player.state.volume == 0,
        isPaused: !player.state.playing,
        resolution: null,
        resolutions: [],
        time: player.state.position,
        volume: player.state.volume,
      ),
    );
    player.stream.error.listen((event) {
      emit(PlayerError(event.replaceRange(event.indexOf("https"), null, "Video")));
    });
    player.stream.track.listen((event) {
      final current = state;
      if (current is PlayerReady) emit(current.copyWith(videoTrack: event.video));
    });
    player.stream.tracks.listen((event) {
      final current = state;
      if (current is PlayerReady) emit(current.copyWith(tracks: event));
    });
    player.stream.playlist.listen((event) {
      final current = state;
      if (current is PlayerReady) {
        windowManager.setTitle(
          event.medias.elementAt(event.index).extras?['title'] ??
              playlist.medias.first.extras?['title'] ??
              "title",
        );
        emit(current.copyWith(playlist: event, currentMedia: event.medias.elementAt(event.index)));
      }
    });
    player.stream.duration.listen((event) {
      final current = state;
      if (current is PlayerReady) emit(current.copyWith(duration: event));
    });
    player.stream.buffering.listen((event) {
      final current = state;
      if (current is PlayerReady) emit(current.copyWith(buffering: event));
    });
    player.stream.buffer.listen((event) {
      final current = state;
      if (current is PlayerReady) emit(current.copyWith(buffer: event));
    });
    player.stream.position.listen((event) {
      final current = state;
      if (current is PlayerReady) {
        if ((event - current.time).abs() < Duration(seconds: 1) || _isSeeking) return;
        emit(current.copyWith(time: event));
      }
    });
  }

  Future<void> previousMedia() async {
    await player.previous();
  }

  Future<void> nextMedia() async {
    await player.next();
  }

  Future<void> toggleFullscreen(BuildContext context, VideoPlayer player) async {
    final current = state;
    if (current is PlayerReady) {
      final isFullscreen = await windowManager.isFullScreen();
      if (isFullscreen) {
        emit(current.copyWith(isFullscreen: false));
        Navigator.pop(context);
        if (Platform.isAndroid || Platform.isIOS) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        } else {
          await windowManager.setFullScreen(false);
        }
      } else {
        emit(current.copyWith(isFullscreen: true));
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
      }
    }
  }

  Future<void> skip(Duration step) async {
    final current = state as PlayerReady;
    seek((current.time + step).clamp(Duration(seconds: 0), current.duration));
  }

  Future<void> seek(Duration time) async {
    _isSeeking = true;
    final current = state as PlayerReady;
    emit(current.copyWith(time: time));
    await player.seek(time);
    _isSeeking = false;
  }

  Future<void> toggleMute() async {
    final current = state as PlayerReady;
    if (player.state.volume == 0) {
      setVolume(current.volume);
    } else {
      mute();
    }
  }

  Future<void> mute() async {
    final current = state as PlayerReady;
    emit(current.copyWith(isMuted: true));
    await player.setVolume(0);
  }

  Future<void> setVolume(double volume) async {
    final current = state as PlayerReady;
    emit(current.copyWith(isMuted: volume == 0, volume: volume));
    await player.setVolume(volume.clamp(0.0, 100.0));
  }

  Future<void> play() async {
    final current = state as PlayerReady;
    emit(current.copyWith(isPaused: false));
    await player.play();
  }

  Future<void> pause() async {
    final current = state as PlayerReady;
    emit(current.copyWith(isPaused: true));
    await player.pause();
  }

  Future<void> togglePlay() async {
    final current = state as PlayerReady;
    emit(current.copyWith(isPaused: !player.state.playing));
    if (player.state.playing) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> setResolution(VideoTrack track) async {
    final current = state as PlayerReady;
    emit(current.copyWith(videoTrack: track));
    player.setVideoTrack(track);
  }

  @override
  Future<void> close() async {
    await player.dispose();
    windowManager.setFullScreen(false);
    emit(PlayerInitial());
    return super.close();
  }
}
