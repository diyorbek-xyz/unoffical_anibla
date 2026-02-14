import 'package:application/data/response_models/episode_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'episode_api_service.g.dart';

@RestApi()
abstract class EpisodeApiService {
  factory EpisodeApiService(Dio dio) = _EpisodeApiService;

  @GET('/v1/episodes/{anime}/{season}')
  Future<HttpResponse<EpisodeResponseModel>> getEpisodes({@Path("anime") String animeSlug = '', @Path("season") String seasonSlug = ''});
}
