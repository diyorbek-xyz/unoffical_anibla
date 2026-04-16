sealed class VideoEvent {
  const VideoEvent();
}

final class GetVideo extends VideoEvent {
  final String url;
  const GetVideo(this.url);
}

final class SetVideoIsPaid extends VideoEvent {
  const SetVideoIsPaid();
}
