sealed class SessionEvent {
  const SessionEvent();
}

final class ExitSession extends SessionEvent {
  final String tokenId;
  const ExitSession(this.tokenId);
}
