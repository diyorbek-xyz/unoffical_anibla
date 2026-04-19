import 'package:application/core/resources/api_response.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'filter_api.g.dart';

@RestApi()
abstract class FilterApi {
  factory FilterApi(Dio dio) = _FilterApi;

  @GET('/v1/{type}/mobile?search={title}')
  Future<HttpResponse<ApiResponse<List<AnimeModel>>>> searchAnime(
    @Path("type") String type,
    @Path("title") String title,
  );
}
