import 'package:application/shared/models/api_response.dart';
import 'package:application/core/resources/cache_entry.dart';
import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/local/saved_anime.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/response/big_response.dart';
import 'package:application/features/anibla/data/source/local/saved_ids_local.dart';
import 'package:application/features/anibla/data/source/network/anime_api.dart';
import 'package:application/features/anibla/domain/repositories/anime_repository.dart';
import 'package:application/features/anibla/data/source/local/history_local.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:retrofit/retrofit.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeApi _animeApi;
  final HistoryLocal _historyLocal;
  final SavedLocal _savedLocal;
  AnimeRepositoryImpl(this._animeApi, this._historyLocal, this._savedLocal);

  final Map<String, CacheEntry<Anime>> _cache = {};

  @override
  Future<Either<Failure, Anime>> getSerie(AnimeType type, String slug) async {
    try {
      final cached = _cache[slug];
      if (cached != null && !cached.isExpired) return Right(cached.data);
      final serie = await _animeApi.getSerie(toBeginningOfSentenceCase("${type.name}s"), slug);
      if (serie.data.success) {
        final data = serie.data.data;
        _cache[slug] = CacheEntry(data);
        await _historyLocal.saveToHistory(serie.data.data);
        return Right(data);
      } else {
        throw ExceptionMapper.mapResponseToDio(serie.response);
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, BigResponse<Anime>>> getHomeAnimes(Pagination query) async {
    try {
      final animes = await _animeApi.getHomeAnimes(query);
      return Right(animes.data);
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
  Future<Either<Failure, SavedAnimes>> getSaveMedias() async {
    try {
      final movieRes = await _animeApi.getSavedMovies();
      final serieRes = await _animeApi.getSavedSeries();
      final movies = movieRes.data.data.map((e) => e.anime).toList();
      final series = serieRes.data.data.map((e) => e.anime).toList();
      await _savedLocal.fullChange((movies + series).map((e) => e.id).toList());

      return Right(SavedAnimes(movies: movies, series: series));
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
