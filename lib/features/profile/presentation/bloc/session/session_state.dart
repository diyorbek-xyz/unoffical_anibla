sealed class SessionState {
  const SessionState();
}

final class SessionExitInitial extends SessionState {
  const SessionExitInitial();
}

final class SessionExitLoading extends SessionState {
  const SessionExitLoading();
}

final class SessionExitSuccess extends SessionState {
  const SessionExitSuccess();
}

final class SessionExitFailed extends SessionState {
  final String message;
  const SessionExitFailed(this.message);
}
