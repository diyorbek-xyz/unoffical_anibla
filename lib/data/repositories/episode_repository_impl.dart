import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/core/resources/dio_exception.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/data/models/param_models/episode_params.dart';
import 'package:application/data/sources/remote/episode_api_service.dart';
import 'package:application/data/sources/remote/video_api_service.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/repositories/episode_repository.dart';
import 'package:dio/dio.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeApiService _episodeApiService;
  final VideoApiService _videoApiService;
  const EpisodeRepositoryImpl(this._episodeApiService, this._videoApiService);

  @override
  Future<DataState<List<EpisodeEntity>>> getEpisodes(GetEpisodesParams params) async {
    try {
      final httpResponse = await _episodeApiService.getEpisodes(animeSlug: params.animeSlug, seasonSlug: params.seasonSlug);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntityList());
      } else {
        return DataFailed(DataException(httpResponse.response).scream());
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<VideoModel>> getVideo(String source) async {
    try {
      final httpResponse = await _videoApiService.getVideo(source);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            message: httpResponse.response.statusMessage,
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

  @override
  Future<DataState<EpisodeEntity>> getEpisode(GetEpisodeParams params) async {
    try {
      final httpResponse = await _episodeApiService.getEpisode(
        animeSlug: params.animeSlug,
        seasonSlug: params.seasonSlug,
        episodeSlug: params.episodeSlug,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntity());
      } else {
        return DataFailed(DataException(httpResponse.response).scream());
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
