import 'package:application/core/resources/cache_entry.dart';
import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:application/features/anibla/data/source/network/season_api.dart';
import 'package:application/features/anibla/domain/repositories/season_repository.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SeasonRepositoryImpl implements SeasonRepository {
  final SeasonApi seasonApi;
  SeasonRepositoryImpl(this.seasonApi);
  final Map<String, CacheEntry<List<Season>>> _cache = {};

  @override
  Future<Either<Failure, List<Season>>> getAllSeasons(String animeSlug) async {
    try {
      final cache = _cache[animeSlug];
      if (cache != null && !cache.isExpired) return Right(cache.data);

      final seasons = await seasonApi.getAllSeasons(animeSlug);
      final data = seasons.data.data.toList();
      _cache[animeSlug] = CacheEntry(data);
      return Right(data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
