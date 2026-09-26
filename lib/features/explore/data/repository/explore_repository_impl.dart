import 'dart:io';

import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/data/genre.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/explore/data/models/search_query.dart';
import 'package:application/features/explore/data/source/local/history_local.dart';
import 'package:application/features/explore/data/source/remote/filter_api.dart';
import 'package:application/features/explore/data/source/remote/genre_api.dart';
import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final GenreApi _apiService;
  final HistoryLocal _historyLocal;
  final FilterApi _filterApi;
  ExploreRepositoryImpl(this._apiService, this._filterApi, this._historyLocal);

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
  Future<Either<Failure, List<Anime>>> searchAnime(AnimeType type, SearchQuery query) async {
    try {
      final httpResponse = await _filterApi.searchAnime(type, query);
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
