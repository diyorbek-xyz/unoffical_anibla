import 'package:application/features/mano/data/models/main/mano_profile.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/data/models/mano_callback.dart';
import 'package:application/features/auth/data/models/mano_callfront.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/features/auth/data/source/remote/auth_api.dart';
import 'package:application/features/auth/data/source/remote/mano_auth_api.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final AuthStorage _authStorage;
  final ManoAuthApi _manoAuthApi;
  const AuthRepositoryImpl(this._authApi, this._authStorage, this._manoAuthApi);

  @override
  Future<Either<Failure, ConfirmedModel>> confirmCode(ConfirmModel body) async {
    try {
      final httpResponse = await _authApi.confirmCode(body);
      await _authStorage.saveAniblaTokens(httpResponse.data.token);

      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> getConfirm(LoginRequestModel body) async {
    try {
      final httpResponse = await _authApi.getConfirm(body);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut(String tokenId, bool isCurrent) async {
    try {
      final httpResponse = await _authApi.exitSession(tokenId);
      if (httpResponse.data.success) {
        if (isCurrent) await _authStorage.clearAniblaTokens();
        return Right(true);
      } else {
        return Left(UnknownFailure(ExceptionMapper.mapResponseToDio(httpResponse.response)));
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ManoCallback>> manoCallback([
    ManoCallfront request = const ManoCallfront(appId: "mano", redirectUri: "https://ma-no.uz/auth/anibla/callback"),
  ]) async {
    try {
      final httpResponse = await _authApi.manoCallback(request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ManoProfile>> manoAuth(String userId) async {
    try {
      final httpResponse = await _manoAuthApi.authAnibla({"code": userId});
      await _authStorage.saveManoTokens(
        TokensModel(accessToken: httpResponse.data.accessToken, refreshToken: httpResponse.data.refreshToken),
      );
      return Right(httpResponse.data.user);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
