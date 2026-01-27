import 'package:application/models/anime.dart';
import 'package:application/services/setup.dart';
import 'package:dio/dio.dart';

class FetchAnimes {
  final int page;
  final int limit;
  const FetchAnimes({this.page = 1, this.limit = 12});

  Future post({String? id = '653f7b1380692ab4bfe9148f'}) async {
    Response<dynamic> response = await dio.post("/season/home", data: {'category': id}, queryParameters: {"page": page, "limit": limit});
    List<Anime> animes = (response.data['data'] as List).map((anime) => Anime.fromJson(anime)).toList();
    return animes;
  }
}

class FetchAnime {
  Future<WatchAnime> get(String id) async {
    Response<dynamic> response = await dio.get("/season/v2/$id");
    WatchAnime anime = WatchAnime.fromJson(response.data);
    return anime;
  }
}
