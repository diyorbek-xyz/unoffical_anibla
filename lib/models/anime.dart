import 'package:application/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String addBaseUrl(String? path) {
  if (path == null) return "";
  if (path.contains(dotenv.env['BASE_URL']!)) {
    return path;
  } else {
    return dotenv.env['BASE_URL']! + path;
  }
}

class Translated {
  final String uz;
  final String rus;
  const Translated({required this.rus, required this.uz});

  factory Translated.fromJson(dynamic json) {
    if (json is String) return Translated(rus: json, uz: json);
    if (json is Map) return Translated(rus: json['ru'] ?? "?", uz: json['uz'] ?? "?");
    return Translated(rus: "?", uz: "?");
  }
  Map<String, dynamic> toJson() => {'uz': uz, 'ru': rus};
}

class Category {
  final Translated title;
  final String id;
  const Category({required this.title, required this.id});

  factory Category.fromJson(dynamic json) {
    if (json is String) {
      return Category(
        title: Translated(rus: json, uz: json),
        id: json,
      );
    }
    if (json is Map) {
      return Category(
        title: Translated(rus: json['nameru'] ?? "?", uz: json['nameuz'] ?? "?"),
        id: json['_id'] ?? "?",
      );
    }
    return Category(
      title: Translated(rus: "?", uz: "?"),
      id: "?",
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': id, 'nameru': title.rus, 'nameuz': title.uz};
  }
}

class Anime {
  final String id;
  final Translated title;
  final Translated description;
  final String poster;
  final String thumbnail;
  final int views;
  final List<Category> categories;
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
    List<Category> translatedCategories = (json['category'] as List).map((e) => Category.fromJson(e)).toList();

    return Anime(
      id: json['_id'],
      title: Translated.fromJson(json['name']),
      description: Translated.fromJson(json['description']),
      thumbnail: addBaseUrl(json['image']),
      poster: addBaseUrl(json['screens'] != null ? json['screens']['original'][1] : json['image']),
      categories: translatedCategories,
      year: int.parse(json['year'] ?? "0000"),
      views: json['view'] ?? 0,
      studio: json['studia'] ?? "noma'lum",
      director: json['rejissor'] ?? "noma'lum",
    );
  }

  Map<String, dynamic> toJson() {
    List<dynamic> dynamicCategories = categories.map((e) => e.toJson()).toList();
    return {
      '_id': id,
      'name': title.toJson(),
      'description': description.toJson(),
      'image': thumbnail,
      'poster': poster,
      'category': dynamicCategories,
      'year': year,
      'view': views,
      'studia': studio,
      'rejissor': director,
    };
  }
}

class Series {
  final String id;
  final String video;
  final Translated title;
  const Series({required this.id, required this.video, required this.title});

  factory Series.fromJson(dynamic json) {
    return Series(id: json['_id'], video: json['video'], title: Translated.fromJson(json['name']));
  }
  Map<String, dynamic> toJson() => {'_id': id, 'video': video, 'name': title.toJson()};
}

class WatchAnime {
  final List<Series> series;
  final Anime anime;
  final List<Comment>? comments;
  const WatchAnime({required this.series, required this.anime, this.comments});

  factory WatchAnime.fromJson(dynamic json) {
    List<Series> series = (json['seria'] as List).map((seria) => Series.fromJson(seria)).toList();
    List<Comment>? comments = json['comment'] != null ? (json['comment'] as List).map((e) => Comment.fromJson(e)).toList() : null;

    return WatchAnime(series: series, anime: Anime.fromJson(json['data']), comments: comments);
  }
  Map<String, dynamic> toJson() => {'seria': series.map((e) => e.toJson()).toList(), 'anime': anime.toJson()};
}

class Comment {
  final String id;
  final String message;
  final User user;
  final int? likes;
  final int? dislikes;
  const Comment({required this.id, this.dislikes, this.likes, required this.message, required this.user});

  factory Comment.fromJson(dynamic json) {
    if (json is String) return Comment(id: json, message: "?", user: User.fromJson(null));
    if (json is Map) {
      return Comment(
        id: json["_id"],
        message: json['message'],
        user: User.fromJson(json['user']),
        dislikes: json['likesCount']['countDislike'],
        likes: json['likesCount']['countLike'],
      );
    }
    return Comment(id: "?", message: "?", user: User.fromJson(null));
  }
}
