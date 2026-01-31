import 'package:application/miscs/utils.dart';
import 'package:application/data/models/filter.dart';
import 'package:application/data/models/translated.dart';
import 'package:application/data/models/user.dart';
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

  @HiveField(12)
  final List<Serie> series;

  @HiveField(13)
  final List<Comment> comments;

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
    required this.series,
    required this.comments,
  });

  factory Anime.fromJson(dynamic json, {dynamic serie, dynamic comment}) {
    List<Category> categories = json['category'] != null ? (json['category'] as List).map((e) => Category.fromJson(e)).toList() : [];
    List<Serie> series = serie != null ? (serie as List).map((e) => Serie.fromJson(e)).toList() : [];
    List<Comment> comments = comment != null ? (comment as List).map((e) => Comment.fromJson(e)).toList() : [];

    return Anime(
      id: json['_id'],
      title: Translated.fromJson(json['name']),
      description: Translated.fromJson(json['description']),
      thumbnail: addBaseUrl(json['image']),
      poster: addBaseUrl(json['screens'] != null ? json['screens']['original'][1] : json['image']),
      categories: categories,
      year: int.parse(json['year'] ?? "0000"),
      views: json['view'] ?? 0,
      studio: json['studia'] ?? "noma'lum",
      director: json['rejissor'] ?? "noma'lum",
      isMovie: json['num'] != null ? json['num'].toLowerCase() == 'film' : false,
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      series: series,
      comments: comments,
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
class Serie {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String video;
  @HiveField(2)
  final Translated title;
  const Serie({required this.id, required this.video, required this.title});

  factory Serie.fromJson(dynamic json) {
    return Serie(id: json['_id'], video: json['video'], title: Translated.fromJson(json['name']));
  }
  Map<String, dynamic> toJson() => {'_id': id, 'video': video, 'name': title.toJson()};
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
