import 'package:application/features/profile/domain/entities/account_entity.dart';
import 'package:application/features/profile/data/source/remote/profile_api.dart';
import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApi _apiService;
  ProfileRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, AccountEntity>> getProfile() async {
    try {
      final httpResponse = await _apiService.getProfile();
      return Right(httpResponse.data.data.toEntity());
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> exitSession(String tokenId) async {
    try {
      final httpResponse = await _apiService.exitSession(tokenId);
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
