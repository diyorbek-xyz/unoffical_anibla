import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/response/genres_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'genre_api.g.dart';

@RestApi()
abstract class GenreApi {
  factory GenreApi(AniblaClient dio) = _GenreApi;

  @GET('/v1/genres')
  Future<HttpResponse<ApiResponse<GenresResponse>>> getTemplate();
}
