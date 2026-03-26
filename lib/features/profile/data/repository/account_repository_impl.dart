import 'dart:io';

import 'package:application/features/auth/data/source/remote/auth_api.dart';
import 'package:application/features/profile/data/source/local/profile_local.dart';
import 'package:application/features/profile/domain/entities/account_entity.dart';
import 'package:application/features/profile/data/source/remote/profile_api.dart';
import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApi _apiService;
  final ProfileLocal _localService;
  final AuthApi _authApi;
  ProfileRepositoryImpl(this._apiService, this._authApi, this._localService);

  @override
  Future<Either<Failure, AccountEntity>> getProfile() async {
    try {
      final httpResponse = await _apiService.getProfile();
      final model = httpResponse.data.data;
      await _localService.saveProfile(model);
      return Right(model.toEntity());
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        if (statusCode == HttpStatus.unauthorized) {
          await _localService.removeProfile();
        } else {
          final profile = await _localService.getProfile();
          if (profile != null) return Right(profile.toEntity());
        }
      }
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> exitSession(String tokenId) async {
    try {
      final httpResponse = await _authApi.exitSession(tokenId);
      if (httpResponse.data.success) {
        return Right(true);
      } else {
        return Left(UnknownFailure(ExceptionMapper.mapResponseToDio(httpResponse.response)));
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
