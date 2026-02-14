import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/data/sources/remote/episode_api_service.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/repositories/episode_repository.dart';
import 'package:application/domain/usecases/episode_usecase.dart';
import 'package:dio/dio.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeApiService _episodeApiService;
  const EpisodeRepositoryImpl(this._episodeApiService);

  @override
  Future<DataState<List<EpisodeEntity>>> getEpisodes(GetEpisodesParams params) async {
    try {
      final httpResponse = await _episodeApiService.getEpisodes(animeSlug: params.animeSlug, seasonSlug: params.seasonSlug);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntityList());
      } else {
        return DataFailed(
          DioException(
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
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
