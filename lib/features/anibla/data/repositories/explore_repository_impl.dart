import 'dart:io';

import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/data/genre.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/request/search_request.dart';
import 'package:application/features/anibla/data/source/local/history_local.dart';
import 'package:application/features/anibla/data/source/network/explore_api.dart';
import 'package:application/features/anibla/data/source/network/genre_api.dart';
import 'package:application/features/anibla/domain/repositories/explore_repository.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final GenreApi _apiService;
  final HistoryLocal _historyLocal;
  final AniblaExploreApi _aniblaExploreApi;
  const ExploreRepositoryImpl(this._apiService, this._aniblaExploreApi, this._historyLocal);

  @override
  Future<Either<Failure, List<Genre>>> getGenres() async {
    try {
      final httpResponse = await _apiService.getTemplate();
      return Right(httpResponse.data.data.genres);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Anime>>> searchAnime(MediaType type, SearchRequest query) async {
    try {
      final httpResponse = await _aniblaExploreApi.searchAnime(type.jsonValue, query);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data.data);
      }
      throw ExceptionMapper.mapResponseToDio(httpResponse.response);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Anime>>> getHistoy() async {
    final animes = await _historyLocal.getHistory();
    if (animes != null && animes.isNotEmpty) {
      return Right(animes);
    }
    return Left(SimpleFailure("Animelar mavjud emas"));
  }

  @override
  Future<void> clearHistoty() async {
    await _historyLocal.clearHistory();
  }

  @override
  Future<void> deleteFromHistory(String id) async {
    await _historyLocal.deleteFromHistory(id);
  }
}
