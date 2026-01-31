import 'package:application/data/models/anime.dart';
import 'package:application/data/setup.dart';
import 'package:dio/dio.dart';

class AnimesApi {
  final int page;
  final int limit;
  const AnimesApi({this.page = 1, this.limit = 12});

  Future<List<Anime>> getAll() async {
    Response<dynamic> response = await dio.post(
      "/season/home",
      data: {'category': "653f7b1380692ab4bfe9148f"},
      queryParameters: {"page": page, "limit": limit},
    );
    List<Anime> animes = (response.data['data'] as List).map((value) => Anime.fromJson(value)).toList();
    return animes;
  }

  Future<List<Anime>> getManyByCategory(String id) async {
    Response<dynamic> responseAnimes = await dio.post(
      "/season/home",
      data: {'category': id},
      queryParameters: {"page": page, "limit": limit},
    );
    List<Anime> animes = (responseAnimes.data['data'] as List).map((value) => Anime.fromJson(value)).toList();

    return animes;
  }

  Future<Anime> getById(String id) async {
    Response<dynamic> response = await dio.get("/season/v2/$id");
    Anime anime = Anime.fromJson(response.data['data'], serie: response.data['seria'], comment: response.data['comment']);
    return anime;
  }

  Future<List<Anime>> getCarousel() async {
    Response<dynamic> response = await dio.get('/slider/client');
    List<Anime> carousel = (response.data['data'] as List).map((value) => Anime.fromJson(value['serial'])).toList();
    return carousel;
  }

  Future<List<Anime>> getCalendar() async {
    Response<dynamic> response = await dio.post(
      "/season/home",
      data: {'category': "653f7b1380692ab4bfe9148f"},
      queryParameters: {"page": 1, "limit": 4},
    );

    List<Anime> animes = (response.data['data'] as List).map((value) => Anime.fromJson(value)).toList();
    return animes;
  }
}
