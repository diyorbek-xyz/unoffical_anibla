import 'package:application/domain/entities/auth/account_entity.dart';
import 'package:dio/dio.dart';

sealed class AuthState {}

final class AuthStateInitial extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {
  final int login;
  AuthLoginSuccess(this.login);
}

final class AuthLoginFailed extends AuthState {
  final DioException exception;
  AuthLoginFailed(this.exception);
}

final class AuthVerifySuccess extends AuthState {
  final AccountEntity account;
  AuthVerifySuccess(this.account);
}


final class AuthVerifyFailed extends AuthState {
  final DioException exception;
  AuthVerifyFailed(this.exception);
}