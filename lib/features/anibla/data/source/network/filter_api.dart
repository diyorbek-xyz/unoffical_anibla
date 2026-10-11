import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/shared/models/api_response.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'filter_api.g.dart';

@RestApi()
abstract class FilterApi {
  factory FilterApi(AniblaClient dio) = _FilterApi;

  @GET('/v1/{type}/mobile')
  Future<HttpResponse<ApiResponse<List<Anime>>>> searchAnime(@Path("type") String type, @Queries() query);
}
