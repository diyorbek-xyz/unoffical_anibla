import 'package:application/core/resources/api_response.dart';
import 'package:application/core/resources/cache_entry.dart';
import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/source/local/saved_ids_local.dart';
import 'package:application/features/animes/data/source/remote/anime_api.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/saved_medias.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:application/features/common/data/models/responses/big_response.dart';
import 'package:application/features/common/data/models/responses/big_response_mapper.dart';
import 'package:application/features/explore/data/source/local/history_local.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:retrofit/retrofit.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeApi _animeApi;
  final HistoryLocal _historyLocal;
  final SavedLocal _savedLocal;
  AnimeRepositoryImpl(this._animeApi, this._historyLocal, this._savedLocal);

  final Map<String, CacheEntry<AnimeEntity>> _cache = {};

  @override
  Future<Either<Failure, AnimeEntity>> getSerie(AnimeType type, String slug) async {
    try {
      final cached = _cache[slug];
      if (cached != null && !cached.isExpired) return Right(cached.data);
      final serie = await _animeApi.getSerie(toBeginningOfSentenceCase("${type.name}s"), slug);
      if (serie.data.success) {
        final data = AnimeMapper.modelToEntity(serie.data.data);
        _cache[slug] = CacheEntry(data);
        await _historyLocal.saveToHistory(serie.data.data!);
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
      final animes = await _animeApi.getHomeAnimes(query);
      return Right(
        BigResponseMapper.toEntity<AnimeModel, AnimeEntity>(animes.data, (a) => a is List ? a!.map(AnimeMapper.modelToEntity).toList() : []),
      );
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> saveMedia(String id, AnimeType type) async {
    try {
      late HttpResponse<ApiResponse> response;
      if (type.isSerie) response = await _animeApi.saveSeries({"media": id});
      if (type.isMovie) response = await _animeApi.saveMovies({"media": id});
      if (response.data.success) {
        await _savedLocal.saveMedia(id);
        return Right(true);
      }
      throw ExceptionMapper.mapResponseToDio(response.response);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> unsaveMedia(String id, AnimeType type) async {
    try {
      late HttpResponse<ApiResponse> response;
      if (type.isSerie) response = await _animeApi.unsaveSeries(id);
      if (type.isMovie) response = await _animeApi.unsaveMovies(id);
      if (response.data.success) {
        await _savedLocal.unsaveMedia(id);
        return Right(true);
      }
      throw ExceptionMapper.mapResponseToDio(response.response);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, SavedMedias>> getSaveMedias() async {
    try {
      final movieRes = await _animeApi.getSavedMovies();
      final serieRes = await _animeApi.getSavedSeries();
      final movies = movieRes.data.data.map((e) => AnimeMapper.modelToEntity(e.anime)).toList();
      final series = serieRes.data.data.map((e) => AnimeMapper.modelToEntity(e.anime)).toList();
      await _savedLocal.fullChange((movies + series).map((e) => e.id).toList());

      return Right(SavedMedias(movies: movies, series: series));
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
