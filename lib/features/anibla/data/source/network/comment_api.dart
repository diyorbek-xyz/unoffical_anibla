import 'package:application/core/resources/api_response.dart';
import 'package:application/features/anibla/data/models/response/comment_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_api.g.dart';

@RestApi()
abstract class CommentApi {
  factory CommentApi(Dio dio) = _CommentApi;

  @GET('/v1/comments/{type}/{id}')
  Future<HttpResponse<ApiResponse<CommentResponse>>> getAnimeComments(
    @Path("type") String type,
    @Path("id") String id,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/v1/comments/{id}')
  Future<HttpResponse<ApiResponse<CommentResponse>>> getReplyComments(@Path("id") String id, [@Query("limit") int limit = 100]);
}
