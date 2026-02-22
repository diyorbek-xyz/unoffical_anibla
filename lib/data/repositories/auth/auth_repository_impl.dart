import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/core/resources/dio_exception.dart';
import 'package:application/data/models/auth/account.dart';
import 'package:application/data/models/auth/verify.dart';
import 'package:application/data/sources/remote/auth/auth_api_service.dart';
import 'package:application/domain/repositories/auth/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _apiService;
  const AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<int>> loginByPhone(int phone) async {
    try {
      final response = await _apiService.loginByNumber({'phone_number': phone});
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data['login']!, response.response);
      } else {
        return DataFailed(DataException(response.response).scream(), response.response);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<AccountModel>> verifyNumber(VerifyModel params) async {
    try {
      final response = await _apiService.verifyCode(params.toJson());
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data.user);
      } else {
        return DataFailed(DataException(response.response).scream());
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
