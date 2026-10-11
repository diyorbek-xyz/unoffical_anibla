import 'dart:io';
import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:application/features/anibla/data/source/local/profile_local.dart';
import 'package:application/features/auth/data/source/remote/auth_api.dart';
import 'package:application/features/anibla/data/source/network/plans_api.dart';
import 'package:application/features/anibla/data/source/network/profile_api.dart';
import 'package:application/features/anibla/domain/repositories/profile_repository.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/ma-no/data/source/network/mano_profile_api.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AuthApi _authApi;
  final PlansApi _plansApi;
  final ProfileApi _profileApi;
  final ProfileLocal _localService;
  final ManoProfileApi _manoProfileApi;
  ProfileRepositoryImpl(this._profileApi, this._authApi, this._localService, this._plansApi, this._manoProfileApi);

  @override
  Future<Either<Failure, Profile>> getAniblaProfile() async {
    try {
      final httpResponse = await _profileApi.getProfile();
      final model = httpResponse.data.data;
      await _localService.saveProfile(model);
      return Right(model);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != HttpStatus.unauthorized) {
        final profile = await _localService.getProfile();
        if (profile != null) return Right(profile);
      }
      if (statusCode == HttpStatus.unauthorized) await _localService.removeProfile();
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Profile>> getManoProfile() async {
    try {
      final id = "ab975cc1-43f8-42a2-9d2c-8bc1f0aec5d0";
      final httpResponse = await _manoProfileApi.getProfile(id);
      return Right(httpResponse.data);
    } on DioException catch (e) {
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

  @override
  Future<Either<Failure, List<Plan>>> getPlans() async {
    try {
      final httpResponse = await _plansApi.getPlans();
      return Right(httpResponse.data.toList());
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(Profile profile) async {
    try {
      if (profile != .anibla()) return Left(ExceptionMapper.mapMessageToFailure("error"));

      final avatar = profile.avatar.toNullable();
      final name = profile.name.toNullable();
      final body = <String, dynamic>{"image": avatar, "name": name};
      final httpResponse = await _profileApi.updateProfile(body);
      final model = httpResponse.data.data;
      await _localService.saveProfile(model);
      return Right(model);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != HttpStatus.unauthorized) {
        final profile = await _localService.getProfile();
        if (profile != null) return Right(profile);
      }
      if (statusCode == HttpStatus.unauthorized) await _localService.removeProfile();
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
