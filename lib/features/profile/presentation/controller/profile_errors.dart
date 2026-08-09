import 'package:application/features/profile/domain/entities/session_entity.dart';

sealed class ProfileFailure implements Exception {
  const ProfileFailure();
}

final class ProfileUnauthorized extends ProfileFailure {
  const ProfileUnauthorized();
}

final class ProfileLimitSession extends ProfileFailure {
  final SessionsEntity sessions;
  ProfileLimitSession(this.sessions);
}

final class ProfileFailed extends ProfileFailure {
  final String message;
  const ProfileFailed(this.message);
}

class SessionState {
  final bool hasError;
  final bool isLoading;
  final String error;
  const SessionState({this.error = "", this.hasError = false, this.isLoading = false});
}
