import 'package:application/data/response_models/anime_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'anime_api_service.g.dart';

@RestApi()
abstract class AnimeApiService {
  factory AnimeApiService(Dio dio) = _AnimeApiService;

  @GET('/v1/series')
  Future<HttpResponse<AnimeResponseModel>> getAnimes({@Query("limit") int? limit = 10, @Query("page") int? page = 1});
}
