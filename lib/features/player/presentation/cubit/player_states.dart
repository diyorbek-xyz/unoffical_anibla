import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/data/models/episode_model.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

final class PlayerStates {
  final bool isPaused;
  final bool hasError;
  final String? error;
  final bool isMuted;
  final bool isFullscreen;
  final double volume;
  final Duration duration;
  final bool buffering;
  final Tracks tracks;
  final VideoTrack videoTrack;
  final EpisodeEntity episode;
  final List<EpisodeEntity> episodes;
  final List<int> skip;
  final bool hasIntro;
  final bool isFirst;
  final bool isLast;
  final BoxFit fit;
  final Stream<Duration> progressStream;
  final Stream<Duration> bufferStream;
  final Duration seekProgress;

  const PlayerStates({
    required this.seekProgress,
    required this.fit,
    required this.progressStream,
    required this.bufferStream,
    required this.isFullscreen,
    required this.isMuted,
    required this.isPaused,
    required this.volume,
    required this.duration,
    required this.buffering,
    required this.tracks,
    required this.videoTrack,
    required this.episode,
    required this.episodes,
    required this.skip,
    required this.hasIntro,
    required this.isFirst,
    required this.isLast,
    required this.hasError,
    this.error,
  });

  PlayerStates copyWith({
    bool? isPaused,
    bool? isMuted,
    bool? isFullscreen,
    double? volume,
    EpisodeEntity? episode,
    VideoController? controller,
    Duration? duration,
    bool? buffering,
    Tracks? tracks,
    VideoTrack? videoTrack,
    List<EpisodeEntity>? episodes,
    List<int>? skip,
    bool? hasIntro,
    bool? isFirst,
    bool? isLast,
    bool? hasError,
    String? error,
    BoxFit? fit,
    Stream<Duration>? progressStream,
    Stream<Duration>? bufferStream,
    Duration? seekProgress,
  }) {
    return PlayerStates(
      seekProgress: seekProgress ?? this.seekProgress,
      progressStream: progressStream ?? this.progressStream,
      bufferStream: bufferStream ?? this.bufferStream,
      fit: fit ?? this.fit,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      isFirst: isFirst ?? this.isFirst,
      isLast: isLast ?? this.isLast,
      hasIntro: hasIntro ?? this.hasIntro,
      skip: skip ?? this.skip,
      episodes: episodes ?? this.episodes,
      videoTrack: videoTrack ?? this.videoTrack,
      tracks: tracks ?? this.tracks,
      buffering: buffering ?? this.buffering,
      duration: duration ?? this.duration,
      episode: episode ?? this.episode,
      isFullscreen: isFullscreen ?? this.isFullscreen,
      isMuted: isMuted ?? this.isMuted,
      isPaused: isPaused ?? this.isPaused,
      volume: volume ?? this.volume,
    );
  }

  int diffirence(PlayerStates state) {
    int score = 0;
    if (state.error != error) score++;
    if (state.hasError != hasError) score++;
    if (state.isFirst != isFirst) score++;
    if (state.isLast != isLast) score++;
    if (state.hasIntro != hasIntro) score++;
    if (state.skip != skip) score++;
    if (state.episodes != episodes) score++;
    if (state.videoTrack != videoTrack) score++;
    if (state.tracks != tracks) score++;
    if (state.buffering != buffering) score++;
    if (state.duration != duration) score++;
    if (state.episode != episode) score++;
    if (state.isFullscreen != isFullscreen) score++;
    if (state.isMuted != isMuted) score++;
    if (state.isPaused != isPaused) score++;
    if (state.volume != volume) score++;
    return score;
  }

  factory PlayerStates.empty() {
    return PlayerStates(
      seekProgress: Duration.zero,
      progressStream: Stream.empty(),
      bufferStream: Stream.empty(),
      fit: BoxFit.contain,
      hasError: true,
      error: "empty",
      skip: [],
      isFirst: false,
      isLast: false,
      hasIntro: false,
      videoTrack: VideoTrack("", "", ""),
      tracks: Tracks(),
      buffering: true,
      duration: Duration(),
      episode: EpisodeMapper.modelToEntity(EpisodeModel()),
      episodes: [],
      isFullscreen: false,
      isMuted: false,
      isPaused: false,
      volume: 100.0,
    );
  }
}
