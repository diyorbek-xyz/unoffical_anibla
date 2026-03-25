import 'package:application/network/errors.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final message = "\n - message: ${err.message}";
    final error = "\n - error: ${err.error}";
    final response = "\n - response: ${err.response}";
    final uri = "\n - url: ${err.requestOptions.uri}";
    final headers = "\n - headers: ${err.requestOptions.headers}";
    final body = "\n - body: ${err.requestOptions.data}";
    final exception = err.response != null ? screamFromResponse(err.response!) : err;
    switch (err.response?.statusCode) {
      case 401:
        print("401 Authentication error: $headers $message");
        break;
      case 404:
        print("401 Endpint not found: $uri $message");
        break;
      default:
        print("${err.response?.statusCode} Error while fetching data: $error $message $uri $response $headers $body");
        break;
    }
    handler.next(exception);
  }
}
