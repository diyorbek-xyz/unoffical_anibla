import 'package:application/data/response_models/season_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'season_api_service.g.dart';

@RestApi()
abstract class SeasonApiService {
  factory SeasonApiService(Dio dio) = _SeasonApiService;

  @GET('/v1/seasons/{anime}')
  Future<HttpResponse<SeasonsResponseModel>> getSeasons({@Path("anime") String animeSlug = ''});

  @GET("/v1/seasons/{anime}/{season}")
  Future<HttpResponse<SeasonResponseModel>> getSeasonBySlug({@Path("anime") String animeSlug = '', @Path("season") String seasonSlug = ''});
}
