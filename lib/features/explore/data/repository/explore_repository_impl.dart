import 'package:application/features/explore/data/source/remote/genre_api.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final GenreApi _apiService;
  ExploreRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<GenreEntity>>> getGenres() async {
    try {
      final httpResponse = await _apiService.getTemplate();
      return Right(httpResponse.data.data.getEntities());
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
