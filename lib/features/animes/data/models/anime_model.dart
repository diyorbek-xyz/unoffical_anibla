import 'package:application/core/utils/base_url.dart';
import 'package:application/features/explore/data/models/genre_model.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(includeIfNull: true)
class AnimeModel {
  @HiveField(0)
  final List? keywords;
  @HiveField(1)
  @JsonKey(name: "_id")
  final String? id;
  @HiveField(2)
  final dynamic uz;
  @HiveField(20)
  final dynamic ru;
  @HiveField(3)
  final String? slug;
  @HiveField(4)
  final dynamic country;
  @HiveField(5)
  final dynamic studio;
  @HiveField(6)
  final dynamic director;
  @HiveField(7)
  final dynamic creators;
  @HiveField(8)
  final List<GenreModel>? genres;
  @HiveField(9)
  final dynamic categories;
  @HiveField(10)
  @JsonKey(name: "published_year")
  final int? publishedYear;
  @HiveField(11)
  @JsonKey(fromJson: addBaseUrl, includeFromJson: true)
  final String? thumbnail;
  @HiveField(12)
  @JsonKey(fromJson: addBaseUrl, includeFromJson: true)
  final String? cover;
  @HiveField(13)
  @JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true)
  final List<String>? images;
  @HiveField(14)
  final String? trailer;
  @HiveField(15)
  final int? age;
  @HiveField(16)
  @JsonKey(name: "total_episodes")
  final int? totalEpisodes;
  @HiveField(17)
  @JsonKey(name: "for_only_mdh")
  final bool? forOnlyMDH;
  @HiveField(18)
  final DateTime? createdAt;
  @HiveField(19)
  final DateTime? updatedAt;

  const AnimeModel({
    this.age,
    this.categories,
    this.country,
    this.cover,
    this.createdAt,
    this.creators,
    this.director,
    this.forOnlyMDH,
    this.genres,
    this.images,
    this.id,
    this.keywords,
    this.publishedYear,
    this.slug,
    this.studio,
    this.thumbnail,
    this.totalEpisodes,
    this.trailer,
    this.updatedAt,
    this.ru,
    this.uz,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}
