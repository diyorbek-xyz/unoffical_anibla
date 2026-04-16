import 'package:application/core/resources/api_response.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'anime_api.g.dart';

@RestApi()
abstract class AnimeApi {
  factory AnimeApi(Dio dio) => _AnimeApi(dio);

  @GET("/v1/{type}/{slug}")
  Future<HttpResponse<ApiResponse<AnimeModel?>>> getSerie(
    @Path("type") String type,
    @Path("slug") String slug,
  );

  @GET("/v1/media/mobile")
  Future<HttpResponse<ApiResponse<List<AnimeModel>>>> getHomeAnimes();
}
