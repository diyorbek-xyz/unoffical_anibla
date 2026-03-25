import 'package:application/features/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginResponseModel data;
  LoginSuccess(this.data);
}

final class ConfirmSuccess extends AuthState {
  final ConfirmedModel data;
  ConfirmSuccess(this.data);
}

final class LoginFailed extends AuthState {
  final DioException exception;
  LoginFailed(this.exception);
}

final class ConfirmFailed extends AuthState {
  final DioException exception;
  ConfirmFailed(this.exception);
}
