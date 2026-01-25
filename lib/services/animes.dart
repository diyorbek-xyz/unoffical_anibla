import 'package:application/services/models/anime.dart';
import 'package:application/services/setup.dart';
import 'package:dio/dio.dart';

class FetchAnimes {
  static final Fetch _fetch = Fetch();
  Future<List<Anime>> get() async {
    Response<dynamic> response = await _fetch.get(url: "/slider/client");
    List<Anime> animes = (response.data['data'] as List).map((anime) => Anime.fromJson(anime["serial"])).toList();
    return animes;
  }
}

class FetchAnime {
  static final Fetch _fetch = Fetch();
  Future<WatchAnime> get(String id) async {
    Response<dynamic> response = await _fetch.get(url: "/season/v2/$id");
    WatchAnime anime = WatchAnime.fromJson(response.data);
    return anime;
  }
}
