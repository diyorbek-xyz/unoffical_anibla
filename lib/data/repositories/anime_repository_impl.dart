import 'dart:io';
import 'package:application/core/resources/data_state.dart';
import 'package:application/data/sources/remote/anime_api_service.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/repositories/anime_repository.dart';
import 'package:dio/dio.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeApiService _animeApiService;
  AnimeRepositoryImpl(this._animeApiService);

  @override
  Future<DataState<List<AnimeEntity>>> getAnimes({int? limit, int? page}) async {
    try {
      final httpResponse = await _animeApiService.getAnimes(limit: limit, page: page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntityList(), httpResponse.response);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
          httpResponse.response,
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
