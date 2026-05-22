import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit/media_kit.dart';

part 'player_states.freezed.dart';

@freezed
sealed class PlayerStates with _$PlayerStates {
  factory PlayerStates({
    required Duration progress,
    required Duration buffer,
    required Duration duration,
    required Tracks tracks,
    required VideoTrack videoTrack,
    required List<int> skip,
    required double volume,
    required bool isBuffering,
    required bool isFullscreen,
    required bool isMuted,
    required bool isPaused,
    required bool hasIntro,
    required bool hasError,
    required BoxFit fit,

    required String title,
    required String streamId,
    required String type,
    required PlaylistPosition position,
    String? error,
  }) = _PlayerStates;

  factory PlayerStates.empty() {
    return PlayerStates(
      title: "",
      streamId: "",
      type: AnimeType.serie,
      position: PlaylistPosition.none,
      buffer: Duration.zero,
      progress: Duration.zero,
      fit: BoxFit.contain,
      hasError: true,
      error: "empty",
      skip: [],
      hasIntro: false,
      videoTrack: VideoTrack("", "", ""),
      tracks: Tracks(),
      isBuffering: true,
      duration: Duration(),
      isFullscreen: false,
      isMuted: false,
      isPaused: false,
      volume: 100.0,
    );
  }
}

enum VideoPlayerState { loading, success, error }

enum PlaylistPosition { first, middle, last, none }

class PlayerProps {
  final String stream;
  final String type;
  final String title;
  final PlaylistPosition position;
  const PlayerProps({required this.position, required this.type, required this.title, required this.stream});
}
