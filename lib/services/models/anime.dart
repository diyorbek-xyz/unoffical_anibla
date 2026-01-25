import 'package:flutter_dotenv/flutter_dotenv.dart';

class Translated {
  final String uz;
  final String rus;
  const Translated({required this.rus, required this.uz});
  factory Translated.fromJson(dynamic json) {
    return Translated(rus: json['ru'], uz: json['uz']);
  }
}

class Anime {
  final String id;
  final Translated title;
  final Translated description;
  final String poster;
  final String thumbnail;
  final int views;
  final List<Translated> categories;
  final int year;
  final String studio;
  final String director;
  const Anime({
    required this.id,
    required this.title,
    required this.description,
    required this.poster,
    required this.thumbnail,
    required this.categories,
    required this.year,
    required this.studio,
    required this.director,
    required this.views,
  });

  factory Anime.fromJson(dynamic json) {
    List<Translated> categories = (json['category'] as List).map((e) => Translated(rus: e['nameru'], uz: e['nameuz'])).toList();
    return Anime(
      id: json['_id'],
      title: Translated.fromJson(json['name']),
      description: Translated.fromJson(json['description']),
      thumbnail: dotenv.env['BASE_URL']! + json['image'],
      poster: dotenv.env['BASE_URL']! + json['screens']['original'][1],
      categories: categories,
      year: int.parse(json['year']),
      views: json['view'] ?? 0,
      studio: json['studia'] ?? "noma'lum",
      director: json['rejissor'] ?? "noma'lum",
    );
  }
}

class Series {
  final String id;
  final String video;
  const Series({required this.id, required this.video});

  factory Series.fromJson(dynamic json) {
    return Series(id: json['_id'], video: json['video']);
  }
}

class WatchAnime {
  final List<Series> series;
  final Anime anime;
  const WatchAnime({required this.series, required this.anime});

  factory WatchAnime.fromJson(dynamic json) {
    List<Series> series = (json['seria'] as List).map((seria) => Series.fromJson(seria)).toList();
    return WatchAnime(series: series, anime: Anime.fromJson(json['data']));
  }
}
