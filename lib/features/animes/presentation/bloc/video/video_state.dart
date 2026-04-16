import 'package:application/features/animes/domain/entities/video_entity.dart';

sealed class VideoState {
  const VideoState();
}

final class VideoInitial extends VideoState {
  const VideoInitial();
}

final class VideoLoading extends VideoState {
  const VideoLoading();
}

final class VideoSuccess extends VideoState {
  final VideoEntity video;
  const VideoSuccess(this.video);
}

final class VideoFailure extends VideoState {
  final String message;
  const VideoFailure(this.message);
}

final class VideoIsPaid extends VideoState {
  const VideoIsPaid();
}
