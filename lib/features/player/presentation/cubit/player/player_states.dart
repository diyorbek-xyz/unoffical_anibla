import 'package:application/features/animes/data/models/anime_model.dart';
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
    required PlayerStatus status,
    required String message,
    required BoxFit fit,
    required AnimeType type,
    required int all,
    required CurrentStream stream,
  }) = _PlayerStates;

  factory PlayerStates.empty() {
    return PlayerStates(
      all: 0,
      stream: CurrentStream.empty(),
      type: AnimeType.serie,
      buffer: Duration.zero,
      progress: Duration.zero,
      fit: BoxFit.contain,
      status: PlayerStatus.empty,
      message: "",
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

enum PlayerStatus { empty, init, error, paid }

@freezed
sealed class PlayerProps with _$PlayerProps {
  factory PlayerProps({
    required final String anime,
    required final AnimeType type,
    required final String cover,
    required final String title,
    required final int offset,
    required final int all,
    required final String stream,
    @Default(false) final bool hasUrl,
  }) = _PlayerProps;
}

@freezed
sealed class CurrentStream with _$CurrentStream {
  factory CurrentStream({
    required final String id,
    required final int offset,
    required final String title,
    required final String anime,
    required final String cover,
    required final String url,
  }) = _CurrentStream;
  factory CurrentStream.empty() => CurrentStream(anime: "", cover: "", id: "", offset: 0, title: "", url: "");
}
