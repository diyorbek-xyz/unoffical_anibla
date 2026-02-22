import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/data/models/filter/category_model.dart';
import 'package:application/data/models/filter/genre_model.dart';
import 'package:application/data/models/other/country_model.dart';
import 'package:application/data/models/users/user_model.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'anime_model.g.dart';

@HiveType(typeId: 10)
class AnimeModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final TranslatedModel? title;
  @HiveField(2)
  final TranslatedModel? description;
  @HiveField(3)
  final List<String>? frames;
  @HiveField(4)
  final String? thumbnail;
  @HiveField(5)
  final String? slug;
  @HiveField(6)
  final String? trailer;
  @HiveField(7)
  final int? age;
  @HiveField(8)
  final String? cover;
  @HiveField(9)
  final int? year;
  @HiveField(10)
  final CountryModel? country;
  @HiveField(11)
  final AccountModel? studio;
  @HiveField(12)
  final AccountModel? director;
  @HiveField(13)
  final List<AccountModel>? creators;
  @HiveField(14)
  final List<GenreModel>? genres;
  @HiveField(15)
  final List<CategoryModel>? categories;
  @HiveField(16)
  final bool? onlyForMDH;
  @HiveField(17)
  final int? totalEpisodes;

  const AnimeModel({
    this.id,
    this.title,
    this.description,
    this.slug,
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
    if (json is Map<String, dynamic>) {
      String baseUrl = dotenv.env['NEW_BASE_URL'] ?? "";
      List<String> frames = json['images'] != null ? (json['images'] as List).map((e) => baseUrl + e.toString()).toList() : [];
      List<AccountModel> creators = json['creators'] != null ? (json['creators'] as List).map(AccountModel.fromJson).toList() : [];
      List<GenreModel> genres = json['genres'] != null ? (json['genres'] as List).map(GenreModel.fromJson).toList() : [];
      List<CategoryModel> categories = json['categories'] != null ? (json['categories'] as List).map(CategoryModel.fromJson).toList() : [];
      return AnimeModel(
        id: json['_id'],
        title: TranslatedModel(ru: json['ru']['title'] ?? "", uz: json['uz']['title'] ?? ""),
        description: TranslatedModel(ru: json['ru']['description'] ?? "", uz: json['uz']['description'] ?? ""),
        frames: frames,
        thumbnail: json['thumbnail'] != null ? Uri.https(baseUrl.replaceAll("https://", ""),  json['thumbnail']).toString() : null,
        slug: json['slug'],
        categories: categories,
        creators: creators,
        genres: genres,
        age: json['age'],
        country: json['country'] != null ? CountryModel.fromJson(json['country']) : CountryModel(),
        cover: json['cover'],
        director: json['director'] != null ? AccountModel.fromJson(json['director']) : AccountModel(),
        studio: json['studio'] != null ? AccountModel.fromJson(json['studio']) : AccountModel(),
        trailer: json['trailer'],
        year: json['published_year'],
        onlyForMDH: json['for_only_mdh'],
        totalEpisodes: json['total_episodes'],
      );
    }
    if (json is String) {
      return AnimeModel(id: json);
    }
    throw Exception("Invalid json format: $json");
  }

  AnimeEntity toEntity() {
    return AnimeEntity(
      age: age,
      categories: categories,
      country: country,
      cover: cover,
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
  final UserModel user;
  @HiveField(3)
  final int? likes;
  @HiveField(4)
  final int? dislikes;

  const CommentModel({required this.id, this.dislikes, this.likes, required this.message, required this.user});

  factory CommentModel.fromJson(dynamic json) {
    if (json is String) return CommentModel(id: json, message: "?", user: UserModel.fromJson(null));
    if (json is Map) {
      return CommentModel(
        id: json["_id"],
        message: json['message'],
        user: UserModel.fromJson(json['user']),
        dislikes: json['likesCount']['countDislike'],
        likes: json['likesCount']['countLike'],
      );
    }
    return CommentModel(id: "?", message: "?", user: UserModel.fromJson(null));
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
