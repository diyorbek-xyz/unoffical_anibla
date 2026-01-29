import 'package:application/boxes/boxes.dart';
import 'package:application/models/anime.dart';
import 'package:application/models/category.dart';
import 'package:application/models/filtered.dart';
import 'package:application/services/setup.dart';
import 'package:dio/dio.dart';

class FetchAnimes {
  final int page;
  final int limit;
  const FetchAnimes({this.page = 1, this.limit = 12});

  Future<List<Anime>> getAll() async {
    Response<dynamic> response = await dio.post(
      "/season/home",
      data: {'category': "653f7b1380692ab4bfe9148f"},
      queryParameters: {"page": page, "limit": limit},
    );
    List<Anime> animes = (response.data['data'] as List).map((value) {
      Anime anime = Anime.fromJson(value);
      animesBox.put(anime.date.millisecondsSinceEpoch.toString(), anime);
      return anime;
    }).toList();
    return animes;
  }

  Future<CategoryFiltered> filter(Category category) async {
    Response<dynamic> responseAnimes = await dio.post(
      "/season/home",
      data: {'category': category.id},
      queryParameters: {"page": page, "limit": limit},
    );
    List<Anime> animes = (responseAnimes.data['data'] as List).map((value) => Anime.fromJson(value)).toList();
    CategoryFiltered filtered = CategoryFiltered(animes: animes, category: category);
    categoryFilteredBox.put(category.id, filtered);
    return filtered;
  }
}

class FetchAnime {
  Future<WatchAnime> get(String id) async {
    Response<dynamic> response = await dio.get("/season/v2/$id");
    WatchAnime anime = WatchAnime.fromJson(response.data);
    return anime;
  }
}

class FetchCarousel {
  Future<List<Anime>> get() async {
    Response<dynamic> response = await dio.get('/slider/client');
    List<Anime> carousel = (response.data['data'] as List).map((value) {
      Anime anime = Anime.fromJson(value['serial']);
      carouselBox.put(anime.id, anime);
      return anime;
    }).toList();
    return carousel;
  }
}
