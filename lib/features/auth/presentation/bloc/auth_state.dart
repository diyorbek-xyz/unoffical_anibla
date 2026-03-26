import 'package:application/features/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class LoginSuccess extends AuthState {
  final LoginResponseModel data;
  const LoginSuccess(this.data);
}

final class LogedOut extends AuthState {
  const LogedOut();
}

final class LogOutFailed extends AuthState {
  final String message;
  const LogOutFailed(this.message);
}

final class LoginFailed extends AuthState {
  final DioException exception;
  const LoginFailed(this.exception);
}

final class ConfirmSuccess extends AuthState {
  final ConfirmedModel data;
  const ConfirmSuccess(this.data);
}

final class ConfirmFailed extends AuthState {
  final DioException exception;
  const ConfirmFailed(this.exception);
}
