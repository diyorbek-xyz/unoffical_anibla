import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/data/models/users/user_model.dart';
import 'package:application/domain/entities/anime_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'anime_model.g.dart';

@HiveType(typeId: 10)
class AnimeModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final TranslatedModel title;
  @HiveField(2)
  final TranslatedModel description;
  @HiveField(3)
  final List<String>? frames;
  @HiveField(4)
  final String? thumbnail;
  @HiveField(5)
  final String slug;
  @HiveField(6)
  final String? trailer;
  @HiveField(7)
  final int? age;
  @HiveField(8)
  final String? cover;
  @HiveField(9)
  final int? year;
  @HiveField(10)
  final String? country;
  @HiveField(11)
  final String? studio;
  @HiveField(12)
  final String? director;
  @HiveField(13)
  final List<String>? creators;
  @HiveField(14)
  final List<String>? genres;
  @HiveField(15)
  final List<String>? categories;
  @HiveField(16)
  final bool? onlyForMDH;
  @HiveField(17)
  final int? totalEpisodes;

  const AnimeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.slug,
    this.frames,
    this.thumbnail,
    this.trailer,
    this.age,
    this.cover,
    this.year,
    this.categories,
    this.country,
    this.creators,
    this.director,
    this.genres,
    this.studio,
    this.onlyForMDH,
    this.totalEpisodes,
  });

  factory AnimeModel.fromJson(dynamic json) {
    String baseUrl = dotenv.env['NEW_BASE_URL'] ?? "";
    List<String> frames = json['images'] != null ? (json['images'] as List).map((e) => baseUrl + e.toString()).toList() : [];
    List<String> creators = json['creators'] != null ? (json['creators'] as List).map((e) => baseUrl + e.toString()).toList() : [];
    List<String> genres = json['genres'] != null ? (json['genres'] as List).map((e) => baseUrl + e.toString()).toList() : [];
    List<String> categories = json['categories'] != null ? (json['categories'] as List).map((e) => baseUrl + e.toString()).toList() : [];
    return AnimeModel(
      id: json['_id'],
      title: TranslatedModel(ru: json['ru']['title'], uz: json['uz']['title']),
      description: TranslatedModel(ru: json['ru']['description'], uz: json['uz']['description']),
      frames: frames,
      thumbnail: json['thumbnail'] != null ? "$baseUrl/${json['thumbnail']}" : null,
      slug: json['slug'],
      categories: categories,
      creators: creators,
      genres: genres,
      age: json['age'],
      country: "json['country']",
      cover: json['cover'],
      director: "json['director']",
      studio: "json['studio']",
      trailer: json['trailer'],
      year: json['published_year'],
      onlyForMDH: json['for_only_mdh'],
      totalEpisodes: json['total_episodes'],
    );
  }

  AnimeEntity toEntity() {
    return AnimeEntity(
      age: age,
      categories: categories,
      country: country,
      cover: country,
      creators: creators,
      description: description,
      director: director,
      forOnlyMDH: onlyForMDH,
      genres: genres,
      id: id,
      images: frames,
      publishedYear: year,
      slug: slug,
      studio: studio,
      thumbnail: thumbnail,
      title: title,
      totalEpisodes: totalEpisodes,
      trailer: trailer,
    );
  }
}

@HiveType(typeId: 13)
class CommentModel {
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

  const CommentModel({required this.id, this.dislikes, this.likes, required this.message, required this.user});

  factory CommentModel.fromJson(dynamic json) {
    if (json is String) return CommentModel(id: json, message: "?", user: User.fromJson(null));
    if (json is Map) {
      return CommentModel(
        id: json["_id"],
        message: json['message'],
        user: User.fromJson(json['user']),
        dislikes: json['likesCount']['countDislike'],
        likes: json['likesCount']['countLike'],
      );
    }
    return CommentModel(id: "?", message: "?", user: User.fromJson(null));
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
