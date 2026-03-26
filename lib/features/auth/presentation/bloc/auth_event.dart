import 'package:application/features/auth/data/models/login_model.dart';

sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final LoginRequestModel body;
  LoginEvent(this.body);
}

final class LogOutEvent extends AuthEvent {
  final bool isCurrent;
  final String tokenId;
  LogOutEvent(this.tokenId, this.isCurrent);
}

final class ConfirmEvent extends AuthEvent {
  final ConfirmModel body;
  ConfirmEvent(this.body);
}
