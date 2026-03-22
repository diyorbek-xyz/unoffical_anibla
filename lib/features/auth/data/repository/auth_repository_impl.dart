import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/data/source/remote/login_api.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginApi loginApi;
  const AuthRepositoryImpl(this.loginApi);

  @override
  Future<DataState<ConfirmedModel>> confirmCode(ConfirmModel body) async {
    try {
      final httpResponse = await loginApi.confirmCode(body);
      if (httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            response: httpResponse.response,
            message: httpResponse.response.data.toString(),
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
          ),
          httpResponse.response,
        );
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
        return DataFailed(
          DioException(
            response: httpResponse.response,
            message: httpResponse.response.data.toString(),
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
          ),
          httpResponse.response,
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
