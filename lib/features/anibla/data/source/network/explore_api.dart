import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_api.g.dart';

@RestApi()
abstract class AniblaExploreApi {
  factory AniblaExploreApi(AniblaClient dio) = _AniblaExploreApi;

  @GET('/v1/{type}/mobile')
  Future<HttpResponse<ApiResponse<List<Anime>>>> searchAnime(@Path("type") String type, @Queries() query);
}
