import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'episode_api.g.dart';

@RestApi()
abstract class EpisodeApi {
  factory EpisodeApi(Dio dio) => _EpisodeApi(dio);

  @GET("/v1/episodes/{animeSlug}/{seasonSlug}")
  Future<HttpResponse<ApiResponse<List<Episode>>>> getEpisodes(
    @Path("animeSlug") String animeSlug,
    @Path("seasonSlug") String seasonSlug,
  );
}
