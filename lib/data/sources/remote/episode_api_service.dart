import 'package:application/data/models/response_models/episode_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'episode_api_service.g.dart';

@RestApi()
abstract class EpisodeApiService {
  factory EpisodeApiService(Dio dio) = _EpisodeApiService;

  @GET('/v1/episodes/{anime}/{season}')
  Future<HttpResponse<EpisodesResponseModel>> getEpisodes({
    @Path("anime") required String animeSlug,
    @Path("season") required String seasonSlug,
  });

  @GET('/v1/episodes/{anime}/{season}/{episode}')
  Future<HttpResponse<EpisodeResponseModel>> getEpisode({
    @Path("anime") required String animeSlug,
    @Path("season") required String seasonSlug,
    @Path("episode") required String episodeSlug,
  });
}
