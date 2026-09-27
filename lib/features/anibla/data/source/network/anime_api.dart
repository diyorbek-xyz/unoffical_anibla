import 'package:application/core/resources/api_response.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/local/saved_anime.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/response/big_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'anime_api.g.dart';

@RestApi()
abstract class AnimeApi {
  factory AnimeApi(Dio dio) => _AnimeApi(dio);

  @GET("/v1/{type}/{slug}")
  Future<HttpResponse<ApiResponse<Anime>>> getSerie(@Path("type") String type, @Path("slug") String slug);
  @GET("/v1/media/mobile")
  Future<HttpResponse<BigResponse<Anime>>> getHomeAnimes(@Queries() Pagination query);

  @GET("/v1/saved-series")
  Future<HttpResponse<ApiResponse<List<SavedAnime>>>> getSavedSeries();
  @GET("/v1/saved-movies")
  Future<HttpResponse<ApiResponse<List<SavedAnime>>>> getSavedMovies();

  @POST("/v1/saved-series")
  Future<HttpResponse<ApiResponse<dynamic>>> saveSeries(@Body() Map<String, String> body);
  @POST("/v1/saved-movies")
  Future<HttpResponse<ApiResponse<dynamic>>> saveMovies(@Body() Map<String, String> body);

  @DELETE("/v1/saved-series/{id}")
  Future<HttpResponse<ApiResponse<dynamic>>> unsaveSeries(@Path("id") String body);
  @DELETE("/v1/saved-movies/{id}")
  Future<HttpResponse<ApiResponse<dynamic>>> unsaveMovies(@Path("id") String body);

}
