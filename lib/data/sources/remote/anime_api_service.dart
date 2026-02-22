import 'package:application/data/models/response_models/anime_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'anime_api_service.g.dart';

@RestApi()
abstract class AnimeApiService {
  factory AnimeApiService(Dio dio) = _AnimeApiService;

  @GET('/v1/{type}/{from}')
  Future<HttpResponse<AnimesResponseModel>> getAnimes({
    @Path("type") required String type,
    @Path("from") required String from,
    @Query("limit") int? limit = 10,
    @Query("page") int? page = 1,
  });

  @GET('/v1/{type}/{anime}')
  Future<HttpResponse<AnimeResponseModel>> getAnime({@Path("type") required String type, @Path("anime") required String anime});

  @GET('/v1/{type}')
  Future<HttpResponse<AnimesResponseModel>> searchAnimes({
    @Path("type") required String type,
    @Query("search") required String search,
    @Query("limit") int? limit = 10,
    @Query("page") int? page = 1,
  });
}
