import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/books_query.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/response/chapter_response.dart';
import 'package:application/features/mano/data/models/response/mano_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "books_api.g.dart";

@RestApi()
abstract class BooksApi {
  factory BooksApi(ManoClient client) = _BooksApi;

  @GET("/v2/{type}")
  Future<HttpResponse<ManoResponse<List<Book>>>> getBooks(@Path("type") BooksQueryType type, @Queries() BooksQuery query);

  @GET("/v2/{type}/{id}")
  Future<HttpResponse<Book>> getBook(@Path("type") BooksQueryType type, @Path("id") String id);

  @GET("/v2/manga/{id}/chapters")
  Future<HttpResponse<ChapterResponse<List<ManoChapter>>>> getChapters(@Path("id") String id, @Queries() ChapterRequest request);

  @GET("/v2/chapter/{id}")
  Future<HttpResponse<ManoChapter>> getChapterPages(@Path("id") String id);
}
