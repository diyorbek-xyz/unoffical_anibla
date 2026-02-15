import 'package:dio/dio.dart';

class DataException {
  final Response response;
  const DataException(this.response);

  DioException scream() {
    return DioException(
      message: response.statusMessage,
      type: DioExceptionType.badResponse,
      response: response,
      error: response.statusMessage,
      requestOptions: response.requestOptions,
    );
  }
}
