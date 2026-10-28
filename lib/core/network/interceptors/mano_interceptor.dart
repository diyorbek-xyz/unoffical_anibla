import 'dart:io';
import 'package:application/core/network/clients/neutral_client.dart';
import 'package:application/core/network/paths/mano_paths.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/data/models/mano_authback.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/shared/utils/device_info.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class ManoInterceptor extends Interceptor {
  final AuthStorage storage;
  final NeutralClient client;
  const ManoInterceptor(this.client, this.storage);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final tokens = await storage.getManoTokens();
    final accessToken = tokens?.accessToken;
    if (accessToken == null) return handler.next(options);
    final newOptions = await _setHeaders(options, accessToken);
    return handler.next(newOptions);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type != DioExceptionType.badResponse || err.response?.statusCode != HttpStatus.unauthorized) return;
    try {
      final isRefreshed = await _refreshToken();
      if (!isRefreshed) return handler.next(err);
      final response = await _reRequest(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (err) {
      await storage.clearManoTokens();
      return handler.next(err);
    } on Failure catch (failure) {
      return handler.next(
        DioException(requestOptions: err.requestOptions, error: failure, message: failure.message, type: .badResponse),
      );
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final tokens = await storage.getManoTokens();
      if (tokens == null) throw SimpleFailure("no tokens");
      final body = {"refresh_token": tokens.refreshToken};
      final response = await client.fetch(
        RequestOptions(baseUrl: ManoPaths.baseUrl, method: HttpMethod.POST, path: ManoPaths.refreshToken, data: body),
      );
      final data = ManoAuthed.fromJson(response.data);
      final newTokens = TokensModel(accessToken: data.accessToken, refreshToken: data.refreshToken);
      await storage.saveManoTokens(newTokens);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Response> _reRequest(RequestOptions options) async {
    final tokens = await storage.getManoTokens();
    if (tokens == null) throw SimpleFailure("no tokens");
    final newOptions = await _setHeaders(options, tokens.accessToken);
    final response = await client.fetch(newOptions);
    return response;
  }

  Future<RequestOptions> _setHeaders(RequestOptions options, String token) async {
    final device = await DeviceInfo.getDeviceInfo();
    options.headers['x-device'] = device.name;
    options.headers['x-platform-os'] = device.platformOS;
    options.headers['x-platform'] = device.platform;
    options.headers['Authorization'] = 'Bearer $token';
    return options;
  }
}
