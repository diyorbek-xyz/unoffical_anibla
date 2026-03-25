import 'dart:io';

import 'package:application/core/resources/api_response.dart';
import 'package:application/features/profile/data/models/session_model.dart';
import 'package:application/features/profile/domain/entities/session_entity.dart';
import 'package:application/network/errors.dart';
import 'package:dio/dio.dart';

sealed class Failure {
  final String message;
  const Failure(this.message);
}

final class ServerFailure extends Failure {
  final int status;
  const ServerFailure(this.status) : super("$status");
}

final class NetworkFailure extends Failure {
  const NetworkFailure() : super("connection_timeout");
}

final class SessionLimitedFailure extends Failure {
  final SessionsEntity sessions;
  SessionLimitedFailure(this.sessions) : super(Errors.tooManySessions);
}

final class UnknownFailure extends Failure {
  final DioException exception;
  UnknownFailure(this.exception) : super(exception.message!);
}

abstract class ExceptionMapper {
  static DioException mapResponseToDio(Response response) {
    return DioException(
      requestOptions: response.requestOptions,
      error: response.statusCode,
      response: response,
      type: DioExceptionType.badResponse,
      message: response.statusMessage,
    );
  }

  static Failure mapDioToFailure(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return NetworkFailure();
      case DioExceptionType.badResponse:
        if (exception.error.toString() == Errors.tooManySessions) {
          return SessionLimitedFailure(
            ApiResponse.fromJson(
              exception.response?.data,
              (json) => SessionsModel.fromJson(json as Map<String, dynamic>).toEntity(),
            ).data,
          );
        }
        final statusCode = exception.response?.statusCode;
        return ServerFailure(statusCode ?? 400);
      default:
        return UnknownFailure(exception);
    }
  }

  static String mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return "Internetga ulanmagansiz";
    } else if (failure is ServerFailure) {
      return mapStatusToMessage(failure.status);
    }
    return "Nimadur xato ketti: ${(failure as UnknownFailure).exception.toString()}";
  }

  static String mapStatusToMessage(int status) {
    switch (status) {
      case HttpStatus.badRequest:
        return "Notog'ri sorov";
      case HttpStatus.conflict:
        return "Bunday ma'lumot avval mavjud";
      case HttpStatus.unauthorized:
        return "Royxatdan o'tmagansiz";
      case HttpStatus.forbidden:
        return "Malumot yo'qolgan";
      case HttpStatus.notFound:
        return "Malumot topilmadi";
      case HttpStatus.methodNotAllowed:
        return "Bu harakat bajarish uchun ruxsat yoq";
      case HttpStatus.loopDetected:
        return "Serverda nosozlik";
      case HttpStatus.noContent:
        return "Malumot yoq";
      case HttpStatus.requestTimeout:
        return "Sorov yuborish vaqti o'tdi";
      default:
        return "Nimadur xato ketti: $status";
    }
  }
}
