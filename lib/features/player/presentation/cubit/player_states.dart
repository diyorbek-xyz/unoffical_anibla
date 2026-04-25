import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

sealed class PlayerStates {
  const PlayerStates();
}

final class PlayerInitial extends PlayerStates {
  const PlayerInitial();
}

final class PlayerReady extends PlayerStates {
  final bool isPaused;
  final bool isMuted;
  final bool isFullscreen;
  final Duration time;
  final double volume;
  final Duration duration;
  final dynamic episode;
  final dynamic resolution;
  final List resolutions;
  final bool buffering;
  final Duration buffer;
  final Playlist playlist;
  final Media currentMedia;
  final Tracks tracks;
  final VideoTrack videoTrack;

  const PlayerReady({
    required this.buffer,
    required this.episode,
    required this.isFullscreen,
    required this.isMuted,
    required this.isPaused,
    required this.resolution,
    required this.resolutions,
    required this.time,
    required this.volume,
    required this.duration,
    required this.buffering,
    required this.playlist,
    required this.currentMedia,
    required this.tracks,
    required this.videoTrack,
  });

  PlayerReady copyWith({
    bool? isPaused,
    bool? isMuted,
    bool? isFullscreen,
    Duration? time,
    double? volume,
    dynamic episode,
    dynamic resolution,
    List? episodes,
    List? resolutions,
    VideoController? controller,
    Duration? duration,
    Duration? buffer,
    bool? buffering,
    Playlist? playlist,
    Media? currentMedia,
    Tracks? tracks,
    VideoTrack? videoTrack,
  }) {
    return PlayerReady(
      videoTrack: videoTrack ?? this.videoTrack,
      tracks: tracks ?? this.tracks,
      currentMedia: currentMedia ?? this.currentMedia,
      playlist: playlist ?? this.playlist,
      buffer: buffer ?? this.buffer,
      buffering: buffering ?? this.buffering,
      duration: duration ?? this.duration,
      episode: episode ?? this.episode,
      isFullscreen: isFullscreen ?? this.isFullscreen,
      isMuted: isMuted ?? this.isMuted,
      isPaused: isPaused ?? this.isPaused,
      resolution: resolution ?? this.resolution,
      resolutions: resolutions ?? this.resolutions,
      time: time ?? this.time,
      volume: volume ?? this.volume,
    );
  }
}

final class PlayerError extends PlayerStates {
  final String message;
  const PlayerError(this.message);
}
