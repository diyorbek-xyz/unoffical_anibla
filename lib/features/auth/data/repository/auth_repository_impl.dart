import 'dart:io';

import 'package:application/core/network/errors.dart';
import 'package:application/core/resources/data_state.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/features/auth/data/source/remote/login_api.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginApi loginApi;
  final AuthStorage authStorage;
  const AuthRepositoryImpl(this.loginApi, this.authStorage);

  @override
  Future<DataState<ConfirmedModel>> confirmCode(ConfirmModel body) async {
    try {
      final httpResponse = await loginApi.confirmCode(body);
      if (httpResponse.response.statusCode == HttpStatus.created) {
        await authStorage.saveTokens(httpResponse.data.token);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(screamFromResponse(httpResponse.response));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<LoginResponseModel>> getConfirm(LoginRequestModel body) async {
    try {
      final httpResponse = await loginApi.getConfirm(body);
      if (httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(screamFromResponse(httpResponse.response));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
