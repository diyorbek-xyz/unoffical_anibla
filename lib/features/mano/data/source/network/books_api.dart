import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:application/features/mano/data/models/request/novel_request.dart';
import 'package:application/features/mano/data/models/response/chapter_response.dart';
import 'package:application/features/mano/data/models/response/mano_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "books_api.g.dart";

@RestApi()
abstract class BooksApi {
  factory BooksApi(ManoClient client) = _BooksApi;

  @GET("/v2/manga")
  Future<HttpResponse<ManoResponse<List<Book>>>> getMangas(@Queries() MangaRequest request);

  @GET("/v2/manga/{id}")
  Future<HttpResponse<Book>> getManga(@Path("id") String id);

  @GET("/v2/novels")
  Future<HttpResponse<ManoResponse<List<Book>>>> getNovels(@Queries() NovelRequest request);

  @GET("/v2/novels/{id}")
  Future<HttpResponse<Book>> getNovel(@Path("id") String id);

  @GET("/v2/{type}/{id}/chapters")
  Future<HttpResponse<ChapterResponse<List<ManoChapter>>>> getChapters(
    @Path("type") String type,
    @Path("id") String id,
    @Queries() ChapterRequest request,
  );
}
