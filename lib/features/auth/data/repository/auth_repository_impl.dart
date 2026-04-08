import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/features/auth/data/source/local/auth_storage.dart';
import 'package:application/features/auth/data/source/remote/auth_api.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  final AuthStorage authStorage;
  const AuthRepositoryImpl(this.authApi, this.authStorage);

  @override
  Future<Either<Failure, ConfirmedModel>> confirmCode(ConfirmModel body) async {
    try {
      final httpResponse = await authApi.confirmCode(body);
      await authStorage.saveTokens(httpResponse.data.token);

      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> getConfirm(
    LoginRequestModel body,
  ) async {
    try {
      final httpResponse = await authApi.getConfirm(body);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut(String tokenId, bool isCurrent) async {
    try {
      final httpResponse = await authApi.exitSession(tokenId);
      if (httpResponse.data.success) {
        if (isCurrent) await authStorage.clearTokens();
        return Right(true);
      } else {
        return Left(
          UnknownFailure(
            ExceptionMapper.mapResponseToDio(httpResponse.response),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
