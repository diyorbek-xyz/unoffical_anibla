import 'package:application/data/models/auth/verify.dart';

sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final int phone;
  LoginEvent(this.phone);
}

final class VerifyEvent extends AuthEvent {
  final VerifyModel verify;
  VerifyEvent(this.verify);
}
