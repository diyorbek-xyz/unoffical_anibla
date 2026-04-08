import 'package:application/core/resources/api_response.dart';
import 'package:application/features/animes/data/models/season_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'season_api.g.dart';

@RestApi()
abstract class SeasonApi {
  factory SeasonApi(Dio dio) = _SeasonApi;

  @GET("/v1/seasons/{slug}")
  Future<HttpResponse<ApiResponse<List<SeasonModel>>>> getAllSeasons(
    @Path("slug") String animeSlug,
  );
  @GET("/v1/seasons/{animeSlug}/{seasonSlug}")
  Future<HttpResponse<ApiResponse<List<SeasonModel>>>> getOneSeason(
    @Path("animeSlug") String animeSlug,
    @Path("seasonSlug") String seasonSlug,
  );
}
