import 'package:application/core/resources/api_response.dart';
import 'package:application/features/animes/data/models/episode_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'episode_api.g.dart';

@RestApi()
abstract class EpisodeApi {
  factory EpisodeApi(Dio dio) => _EpisodeApi(dio);

  @GET("/v1/episodes/{animeSlug}/{seasonSlug}")
  Future<HttpResponse<ApiResponse<List<EpisodeModel>>>> getEpisodes(
    @Path("animeSlug") String animeSlug,
    @Path("seasonSlug") String seasonSlug,
  );
}
