import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage storage;
  AuthInterceptor(this.storage);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (!response.data['success']) {
      switch (response.data['error']) {
        case "too_many_sessions":
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              error: response.data['error'],
              message: response.data['message'],
              response: response,
            ),
          );
          return;
        default:
          handler.next(response);
          break;
      }
    } else {
      handler.next(response);
    }
  }
}
