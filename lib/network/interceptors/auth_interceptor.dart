import 'dart:io';

import 'package:application/core/utils/device_info.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/injection_container.dart';
import 'package:application/network/interceptors/error_interceptor.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage storage;
  AuthInterceptor(this.storage);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.getAccessToken();
    final newOptions = await setHeaders(options, token ?? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjZmYjliNzcwYzY1MjcxMGJlNTUxZjRmIiwidG9rZW5faWQiOiJhOTEyOWNkOC1jYjc2LTQ4OWMtYTZjMS0wMGFlZjExNWUyNWEiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNzg2MDA4NjYwLCJleHAiOjE3ODcyMTgyNjB9.FoJYa5l0C_ceyVlTXfbnaJ0z4u_QyxtDL0ynupcPj_M");
    handler.next(newOptions);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse && err.response?.statusCode == HttpStatus.unauthorized) {
      try {
        final refreshToken = await storage.getRefreshToken();
        if (refreshToken == null) return handler.next(err);
        final dio = Dio(sl<BaseOptions>());
        dio.interceptors.add(ErrorInterceptor());
        final options = await setHeaders(err.requestOptions, refreshToken);
        final response = await dio.fetch(options);
        return handler.resolve(response);
      } on DioException catch (err) {
        await storage.clearTokens();
        return handler.next(err);
      }
    }
    handler.next(err);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (response.data['success'] != null && !response.data['success']) {
      switch (response.data['error']) {
        case "too_many_sessions":
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              error: response.data['error'],
              message: response.data['message'],
              response: response,
              type: DioExceptionType.badResponse,
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

  Future<RequestOptions> setHeaders(RequestOptions options, String token) async {
    final device = await DeviceInfo.getDeviceInfo();
    options.headers['x-device'] = device.name;
    options.headers['x-platform-os'] = device.platformOS;
    options.headers['x-platform'] = device.platform;
    options.headers['Authorization'] = 'Bearer $token';
    return options;
  }
}
