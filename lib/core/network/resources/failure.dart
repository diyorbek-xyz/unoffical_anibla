import 'dart:io';

import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/data/session.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:dio/dio.dart';

sealed class Failure implements Exception {
  final String message;
  const Failure(this.message);
}

final class ServerFailure extends Failure {
  final int status;
  const ServerFailure(this.status) : super("$status");
}

final class SimpleFailure extends Failure {
  const SimpleFailure(super.message);
}

final class NetworkFailure extends Failure {
  const NetworkFailure() : super("connection_timeout");
}

final class SessionLimitedFailure extends Failure {
  final Sessions sessions;
  SessionLimitedFailure(this.sessions) : super(Errors.tooManySessions);
}

final class UnknownFailure extends Failure {
  final dynamic exception;
  UnknownFailure(this.exception) : super(exception.message);
}

abstract class ExceptionMapper {
  static DioException mapResponseToDio(Response response) => DioException(
    requestOptions: response.requestOptions,
    error: response.data?['message'] ?? response.statusMessage ?? response.statusCode,
    response: response,
    type: DioExceptionType.badResponse,
    message: response.data?['message'] ?? response.statusMessage,
  );

  static Failure mapDioToFailure(DioException exception) => switch (exception.type) {
    DioExceptionType.connectionError || DioExceptionType.connectionTimeout => NetworkFailure(),
    DioExceptionType.badResponse => (() {
      if (exception.response?.data is! Map<String, dynamic>) return SimpleFailure(exception.response?.data);
      return switch (exception.response?.data?['message']?.toString()) {
        Errors.tooManySessions => SessionLimitedFailure(
          ApiResponse.fromJson(exception.response?.data, (json) => Sessions.fromJson(json as Map<String, dynamic>)).data,
        ),
        Errors.userNotFound => SimpleFailure("Foydalanuvchi topilmadi"),
        Errors.seriesAlreadyExist => ServerFailure(HttpStatus.conflict),
        _ => ServerFailure(exception.response?.statusCode ?? 400),
      };
    })(),
    _ => UnknownFailure(exception.toString()),
  };

  static String mapFailureToMessage(Failure failure) => switch (failure) {
    NetworkFailure() => "Internet aloqasi yo'q",
    SessionLimitedFailure() => "Juda ko'p sessiya ochilgan",
    UnknownFailure(:final exception) => "Nimadur xato ketti: $exception",
    ServerFailure(:final status) => ErrorMessages.fromStatus(status),
    SimpleFailure(:final message) => message,
  };

  static String mapStatusToMessage(int status) => ErrorMessages.fromStatus(status);

  static Failure mapMessageToFailure(String message) => SimpleFailure(message);

  static const errors = Errors;
}
