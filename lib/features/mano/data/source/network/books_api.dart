import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/main/novel.dart';
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
  Future<HttpResponse<ManoResponse<List<Manga>>>> getMangas(@Queries() MangaRequest request);

  @GET("/v2/manga/{id}")
  Future<HttpResponse<Manga>> getManga(@Path("id") String id);

  @GET("/v2/novels")
  Future<HttpResponse<ManoResponse<List<Novel>>>> getNovels(@Queries() NovelRequest request);

  @GET("/v2/novels/{id}")
  Future<HttpResponse<Novel>> getNovel(@Path("id") String id);

  @GET("/v2/{type}/{id}/chapters")
  Future<HttpResponse<ChapterResponse<List<ManoChapter>>>> getChapters(
    @Path("type") String type,
    @Path("id") String id,
    @Queries() ChapterRequest request,
  );
}
