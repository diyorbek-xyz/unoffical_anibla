import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/features/mano/data/models/main/manga.dart';
import 'package:application/features/mano/data/models/request/manga_request.dart';
import 'package:application/features/mano/data/models/response/mano_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "books_api.g.dart";

@RestApi()
abstract class BooksApi {
  factory BooksApi(ManoClient client) = _BooksApi;

  @GET("/v2/manga")
  Future<HttpResponse<ManoResponse<List<Manga>>>> getMangas(@Queries() MangaRequest request);
}
