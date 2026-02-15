sealed class RemoteVideoEvent {
  const RemoteVideoEvent();
}

final class GetVideo extends RemoteVideoEvent {
  final String source;
  const GetVideo(this.source);
}
