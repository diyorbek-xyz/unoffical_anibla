import 'package:application/core/resources/api_response.dart';
import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'filter_api.g.dart';

@RestApi()
abstract class FilterApi {
  factory FilterApi(Dio dio) = _FilterApi;

  @GET('/v1/{type}/mobile')
  Future<HttpResponse<ApiResponse<List<Anime>>>> searchAnime(@Path("type") AnimeType type, @Queries() query);
}
