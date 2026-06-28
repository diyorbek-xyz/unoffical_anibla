import 'package:application/core/resources/cache_entry.dart';
import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/source/remote/anime_api.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/data/models/responses/big_response.dart';
import 'package:application/features/common/data/models/responses/big_response_mapper.dart';
import 'package:application/features/explore/data/source/local/history_local.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeApi animeApi;
  final HistoryLocal historyLocal;
  AnimeRepositoryImpl(this.animeApi, this.historyLocal);

  final Map<String, CacheEntry<AnimeEntity>> _cache = {};

  @override
  Future<Either<Failure, AnimeEntity>> getSerie(String type, String slug) async {
    try {
      final cached = _cache[slug];
      if (cached != null && !cached.isExpired) return Right(cached.data);
      final serie = await animeApi.getSerie(type.toLowerCase(), slug);
      if (serie.data.success) {
        final data = AnimeMapper.modelToEntity(serie.data.data);
        _cache[slug] = CacheEntry(data);
        await historyLocal.saveToHistory(serie.data.data!);
        return Right(data);
      } else {
        throw ExceptionMapper.mapResponseToDio(serie.response);
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, BigResponse<AnimeEntity>>> getHomeAnimes(Paginator query) async {
    try {
      final animes = await animeApi.getHomeAnimes(query);
      return Right(
        BigResponseMapper.toEntity<AnimeModel, AnimeEntity>(animes.data, (a) => a is List ? a!.map(AnimeMapper.modelToEntity).toList() : []),
      );
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
