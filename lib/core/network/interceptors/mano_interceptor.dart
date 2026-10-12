import 'dart:io';
import 'package:application/core/network/clients/neutral_client.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/shared/utils/device_info.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:dio/dio.dart';

class ManoInterceptor extends Interceptor {
  final AuthRepository _repository;
  final AuthStorage _storage;
  final NeutralClient _client;
  const ManoInterceptor(this._client, this._repository, this._storage);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type != DioExceptionType.badResponse || err.response?.statusCode != HttpStatus.unauthorized) return;

    try {
      final either = await _repository.manoRefreshToken();
      either.getData();
      final token = await _storage.getManoTokens();
      if (token == null) return handler.next(err);
      final options = await setHeaders(err.requestOptions, token.accessToken);
      final response = await _client.fetch(options);
      return handler.resolve(response);
    } on DioException catch (err) {
      await _storage.clearManoTokens();
      return handler.next(err);
    } on Failure catch (failure) {
      return handler.next(
        DioException(requestOptions: err.requestOptions, error: failure, message: failure.message, type: .badResponse),
      );
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
