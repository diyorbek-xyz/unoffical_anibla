import 'package:dio/dio.dart';

abstract class Errors {
  static final tooManySessions = "too_many_sessions";
}

DioException screamFromResponse(Response response) {
  return DioException(
    requestOptions: response.requestOptions,
    error: response.statusMessage,
    message: response.toString(),
    response: response,
    type: DioExceptionType.badResponse,
  );
}
