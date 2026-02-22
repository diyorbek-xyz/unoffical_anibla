import 'dart:io';
import 'package:application/core/resources/data_state.dart';
import 'package:application/core/resources/dio_exception.dart';
import 'package:application/data/models/param_models/anime_params.dart';
import 'package:application/data/models/param_models/search_params.dart';
import 'package:application/data/sources/remote/anime_api_service.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/repositories/anime_repository.dart';
import 'package:dio/dio.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeApiService _animeApiService;
  AnimeRepositoryImpl(this._animeApiService);

  @override
  Future<DataState<List<AnimeEntity>>> getAnimes(GetAnimesParams params) async {
    try {
      final httpResponse = await _animeApiService.getAnimes(type: params.type, from: params.from, limit: params.limit, page: params.page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntityList(), httpResponse.response);
      } else {
        return DataFailed(DataException(httpResponse.response).scream(), httpResponse.response);
      }
    } catch (e) {
      rethrow;
      // return DataFailed(e);
    }
  }

  @override
  Future<DataState<AnimeEntity>> getAnime(GetAnimeDetailsParams params) async {
    try {
      final httpResponse = await _animeApiService.getAnime(anime: params.slug, type: params.type);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntity(), httpResponse.response);
      } else {
        return DataFailed(DataException(httpResponse.response).scream(), httpResponse.response);
      }
    } on DioException catch (e) {
      return DataFailed(e, e.response);
    }
  }

  @override
  Future<DataState<List<AnimeEntity>>> searchAnimes(SearchParams params) async {
    try {
      final httpRespone = await _animeApiService.searchAnimes(
        type: params.type,
        search: params.query,
        limit: params.limit,
        page: params.page,
      );
      if (httpRespone.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpRespone.data.getEntityList(), httpRespone.response);
      } else {
        return DataFailed(DataException(httpRespone.response).scream(), httpRespone.response);
      }
    } on DioException catch (e) {
      return DataFailed(e, e.response);
    }
  }
}
