import 'package:application/network/resources/failure.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    final error = "\n - error: ${err.error}";
    final response = "\n - response: ${err.response}";
    final uri = "\n - url: ${err.requestOptions.uri}";
    final headers = "\n - headers: ${err.requestOptions.headers}";
    final body = "\n - body: ${err.requestOptions.data}";
    final exception = err.response != null ? ExceptionMapper.mapResponseToDio(err.response!) : err;
    if (status != null) {
      print(
        "${ExceptionMapper.mapStatusToMessage(status)} \n ERROR while fetchind data:$error $uri $response $headers $body",
      );
    } else {
      print(err.toString());
      print(err.response.toString());
    }
    handler.next(exception);
  }
}
