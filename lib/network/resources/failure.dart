import 'package:application/core/resources/api_response.dart';
import 'package:application/features/profile/data/mapper/session_mapper.dart';
import 'package:application/features/profile/data/models/profile/session_model.dart';
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

final class SimpleFailure extends Failure {
  const SimpleFailure(super.message);
}

final class NetworkFailure extends Failure {
  const NetworkFailure() : super("connection_timeout");
}

final class SessionLimitedFailure extends Failure {
  final SessionsEntity sessions;
  SessionLimitedFailure(this.sessions) : super(Errors.tooManySessions);
}

final class UnknownFailure extends Failure {
  final dynamic exception;
  UnknownFailure(this.exception) : super(exception.message);
}

abstract class ExceptionMapper {
  static DioException mapResponseToDio(Response response) {
    return DioException(
      requestOptions: response.requestOptions,
      error: response.data?['message'] ?? response.statusMessage ?? response.statusCode,
      response: response,
      type: DioExceptionType.badResponse,
      message: response.data?['message'] ?? response.statusMessage,
    );
  }

  static Failure mapDioToFailure(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return NetworkFailure();
      case DioExceptionType.badResponse:
        if (exception.response?.data is! Map<String, dynamic>) {
          return SimpleFailure(exception.response?.data);
        }
        switch (exception.response?.data?['error']?.toString()) {
          case Errors.userNotFound:
            return SimpleFailure("Foydalanuvchi topilmadi");
          case Errors.tooManySessions:
            return SessionLimitedFailure(
              ApiResponse.fromJson(
                exception.response?.data,
                (json) => SessionMapper.modelsToEntities(
                  SessionsModel.fromJson(json as Map<String, dynamic>),
                ),
              ).data,
            );
          default:
            final statusCode = exception.response?.statusCode;
            return ServerFailure(statusCode ?? 400);
        }
      default:
        return UnknownFailure(exception.toString());
    }
  }

  static String mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return "Internetga ulanmagansiz";
    } else if (failure is ServerFailure) {
      return ErrorMessages.fromStatus(failure.status);
    } else if (failure is SimpleFailure) {
      return failure.message;
    }
    return "Nimadur xato ketti: ${(failure as UnknownFailure).exception.toString()}";
  }

  static String mapStatusToMessage(int status) => ErrorMessages.fromStatus(status);

  static Failure mapMessageToFailure(String message) => SimpleFailure(message);

  static const errors = Errors;
}
