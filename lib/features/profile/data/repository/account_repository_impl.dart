import 'dart:io';

import 'package:application/features/auth/data/source/remote/auth_api.dart';
import 'package:application/features/profile/data/models/profile_model.dart';
import 'package:application/features/profile/data/source/local/profile_local.dart';
import 'package:application/features/profile/domain/entities/profile_entity.dart';
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
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      late ProfileModel model;
      try {
        final httpResponse = await _apiService.getProfile();
        model = httpResponse.data.data;
        await _localService.saveProfile(model);
      } catch (e) {
        final profile = await _localService.getProfile();
        if (profile != null) return Right(profile.toEntity());
        rethrow;
      }
      return Right(model.toEntity());
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode == HttpStatus.unauthorized) {
        await _localService.removeProfile();
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
