import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'season_api.g.dart';

@RestApi()
abstract class SeasonApi {
  factory SeasonApi(AniblaClient dio) = _SeasonApi;

  @GET("/v1/seasons/{slug}")
  Future<HttpResponse<ApiResponse<List<Season>>>> getAllSeasons(@Path("slug") String animeSlug);
  @GET("/v1/seasons/{animeSlug}/{seasonSlug}")
  Future<HttpResponse<ApiResponse<List<Season>>>> getOneSeason(
    @Path("animeSlug") String animeSlug,
    @Path("seasonSlug") String seasonSlug,
  );
}
