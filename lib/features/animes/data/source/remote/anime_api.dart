import 'package:application/core/resources/api_response.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'anime_api.g.dart';

@RestApi()
abstract class AnimeApi {
  factory AnimeApi(Dio dio) => _AnimeApi(dio);

  @GET("/v1/series/{slug}")
  Future<HttpResponse<ApiResponse<AnimeModel>>> getSerie(@Path("slug") String slug);
}
