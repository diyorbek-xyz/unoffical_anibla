import 'package:application/core/resources/api_response.dart';
import 'package:application/features/anibla/data/models/response/genres_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'genre_api.g.dart';

@RestApi()
abstract class GenreApi {
  factory GenreApi(Dio dio) = _GenreApi;

  @GET('/v1/genres')
  Future<HttpResponse<ApiResponse<GenresResponse>>> getTemplate();
}
