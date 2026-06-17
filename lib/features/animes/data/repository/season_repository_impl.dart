import 'package:application/core/resources/cache_entry.dart';
import 'package:application/features/animes/data/mapper/season_mapper.dart';
import 'package:application/features/animes/data/source/remote/season_api.dart';
import 'package:application/features/animes/domain/entities/season_entity.dart';
import 'package:application/features/animes/domain/repository/season_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SeasonRepositoryImpl implements SeasonRepository {
  final SeasonApi seasonApi;
  SeasonRepositoryImpl(this.seasonApi);
  final Map<String, CacheEntry<List<SeasonEntity>>> _cache = {};

  @override
  Future<Either<Failure, List<SeasonEntity>>> getAllSeasons(String animeSlug) async {
    try {
      final cache = _cache[animeSlug];
      if (cache != null && !cache.isExpired) return Right(cache.data);

      final seasons = await seasonApi.getAllSeasons(animeSlug);
      final data = seasons.data.data.map(SeasonMapper.modelToEntity).toList();
      _cache[animeSlug] = CacheEntry(data);
      return Right(data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
