import 'dart:io';
import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/shared/utils/device_info.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/injection_container.dart';
import 'package:application/core/network/interceptors/error_interceptor.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage storage;
  const AuthInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.getAniblaTokens();
    final staticToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNmE2OWFlNzJhODA0YmNkOTZmYjY3N2M2IiwidG9rZW5faWQiOiJhMjA2NTA2Yy1iMjgzLTQzMmMtYTdkNi1hMWVhZTk3ZmI0YjUiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNzkxMzgxMjIwLCJleHAiOjE3OTI1OTA4MjB9.D2VvOwz7K7rESKuCSX9uoJEGApwk1Epwv7oQP4pMcDY";
    final newOptions = await setHeaders(options, token?.accessToken ?? staticToken);
    handler.next(newOptions);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse && err.response?.statusCode == HttpStatus.unauthorized) {
      try {
        final refreshToken = await storage.getAniblaTokens();
        if (refreshToken == null) return handler.next(err);
        final dio = Dio(sl<AniblaClient>().options);
        dio.interceptors.add(ErrorInterceptor());

        final options = await setHeaders(err.requestOptions, refreshToken.refreshToken);
        final response = await dio.fetch(options);
        return handler.resolve(response);
      } on DioException catch (err) {
        await storage.clearAniblaTokens();
        return handler.next(err);
      }
    }
    handler.next(err);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) => switch (response.data['error']) {
    Errors.tooManySessions => handler.reject(ExceptionMapper.mapResponseToDio(response)),
    _ => handler.next(response),
  };

  Future<RequestOptions> setHeaders(RequestOptions options, String token) async {
    final device = await DeviceInfo.getDeviceInfo();
    options.headers['x-device'] = device.name;
    options.headers['x-platform-os'] = device.platformOS;
    options.headers['x-platform'] = device.platform;
    options.headers['Authorization'] = 'Bearer $token';
    return options;
  }
}
