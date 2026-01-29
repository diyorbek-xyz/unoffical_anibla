import 'package:application/miscs/utils.dart';
import 'package:application/models/category.dart';
import 'package:application/models/translated.dart';
import 'package:application/models/user.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'anime.g.dart';

@HiveType(typeId: 1)
class Anime {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final Translated title;

  @HiveField(2)
  final Translated description;

  @HiveField(3)
  final String poster;

  @HiveField(4)
  final String thumbnail;

  @HiveField(5)
  final int views;

  @HiveField(6)
  final List<Category> categories;

  @HiveField(7)
  final int year;

  @HiveField(8)
  final String studio;

  @HiveField(9)
  final String director;

  @HiveField(10)
  final bool isMovie;

  @HiveField(11)
  final DateTime date;

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
    required this.isMovie,
    required this.date,
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
      isMovie: json['num'] != null ? json['num'].toLowerCase() == 'film' : false,
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
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
      'date': date.toString(),
    };
  }
}

@HiveType(typeId: 2)
class Series {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String video;
  @HiveField(2)
  final Translated title;
  const Series({required this.id, required this.video, required this.title});

  factory Series.fromJson(dynamic json) {
    return Series(id: json['_id'], video: json['video'], title: Translated.fromJson(json['name']));
  }
  Map<String, dynamic> toJson() => {'_id': id, 'video': video, 'name': title.toJson()};
}

@HiveType(typeId: 3)
class WatchAnime {
  @HiveField(0)
  final List<Series> series;
  @HiveField(1)
  final Anime anime;
  @HiveField(2)
  final List<Comment>? comments;
  const WatchAnime({required this.series, required this.anime, this.comments});

  factory WatchAnime.fromJson(dynamic json) {
    List<Series> series = (json['seria'] as List).map((seria) => Series.fromJson(seria)).toList();
    List<Comment>? comments = json['comment'] != null ? (json['comment'] as List).map((e) => Comment.fromJson(e)).toList() : null;
    return WatchAnime(series: series, anime: Anime.fromJson(json['data']), comments: comments);
  }
  Map<String, dynamic> toJson() => {'seria': series.map((e) => e.toJson()).toList(), 'anime': anime.toJson()};
}

@HiveType(typeId: 4)
class Comment {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final User user;
  @HiveField(3)
  final int? likes;
  @HiveField(4)
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
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "message": message,
      "user": user.toJson(),
      "likesCount": {"countDislike": dislikes, "countLike": likes},
    };
  }
}
