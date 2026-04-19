import 'dart:io';

import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/explore/data/models/search_query.dart';
import 'package:application/features/explore/data/source/local/history_local.dart';
import 'package:application/features/explore/data/source/remote/filter_api.dart';
import 'package:application/features/explore/data/source/remote/genre_api.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
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
  Future<Either<Failure, List<GenreEntity>>> getGenres() async {
    try {
      final httpResponse = await _apiService.getTemplate();
      return Right(httpResponse.data.data.getEntities());
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> searchAnime(String type, SearchQuery query) async {
    try {
      final httpResponse = await _filterApi.searchAnime(
        type,
        search: query.search,
        category: query.category,
        genre: query.genre,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data.data.map(AnimeMapper.modelToEntity).toList());
      }
      throw ExceptionMapper.mapResponseToDio(httpResponse.response);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> getHistoy() async {
    final animes = await _historyLocal.getHistory();
    if (animes != null && animes.isNotEmpty) {
      return Right(animes.map(AnimeMapper.modelToEntity).toList());
    }
    return Left(SimpleFailure("Animelar mavjud emas"));
  }
}
