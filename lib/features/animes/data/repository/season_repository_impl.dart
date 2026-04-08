import 'package:application/features/animes/data/models/season_model.dart';
import 'package:application/features/animes/data/source/remote/season_api.dart';
import 'package:application/features/animes/domain/repository/season_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SeasonRepositoryImpl implements SeasonRepository {
  final SeasonApi seasonApi;
  const SeasonRepositoryImpl(this.seasonApi);

  @override
  Future<Either<Failure, List<SeasonModel>>> getAllSeasons(String animeSlug) async {
    try {
      final seasons = await seasonApi.getAllSeasons(animeSlug);
      return Right(seasons.data.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
