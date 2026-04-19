import 'dart:io';

import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/explore/data/source/remote/filter_api.dart';
import 'package:application/features/explore/data/source/remote/genre_api.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final GenreApi _apiService;
  final FilterApi _filterApi;
  ExploreRepositoryImpl(this._apiService, this._filterApi);

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
  Future<Either<Failure, List<AnimeEntity>>> searchAnime(String type, String title) async {
    try {
      final httpResponse = await _filterApi.searchAnime(type, title);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data.data.map(AnimeMapper.modelToEntity).toList());
      }
      throw ExceptionMapper.mapResponseToDio(httpResponse.response);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
