import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/param_models/season_params.dart';
import 'package:application/data/sources/remote/season_api_service.dart';
import 'package:application/domain/entities/animes/season_entity.dart';
import 'package:application/domain/repositories/season_repository.dart';
import 'package:dio/dio.dart';

class SeasonRepositoryImpl implements SeasonRepository {
  final SeasonApiService _seasonApiService;
  const SeasonRepositoryImpl(this._seasonApiService);

  @override
  Future<DataState<List<SeasonEntity>>> getSeasons(GetSeasonsParams params) async {
    try {
      final httpResponse = await _seasonApiService.getSeasons(animeSlug: params.animeSlug);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntityList());
      } else {
        return DataFailed(
          DioException(
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SeasonEntity>> getSeasonBySlug(GetSeasonParams params) async {
    try {
      final httpResponse = await _seasonApiService.getSeasonBySlug(animeSlug: params.animeSlug, seasonSlug: params.seasonSlug);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntity());
      } else {
        return DataFailed(
          DioException(
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
