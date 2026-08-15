import 'package:application/core/utils/base_url.dart';
import 'package:application/features/common/data/models/miscs/item_model.dart';
import 'package:application/features/explore/data/models/genre_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';

part 'anime_model.g.dart';
part 'anime_model.freezed.dart';

@HiveType(typeId: 9483)
enum AnimeType {
  @HiveField(0)
  @JsonValue("Movies")
  movie,
  @HiveField(1)
  @JsonValue("Series")
  serie;

  bool get isMovie => this == AnimeType.movie;
  bool get isSerie => this == AnimeType.serie;
  static AnimeType fromString(String str) => str.toLowerCase().contains("movie") ? .movie : .serie;

  @override
  String toString() => toBeginningOfSentenceCase("${name}s");
}

@freezed
@HiveType(typeId: 2)
abstract class AnimeModel with _$AnimeModel {
  factory AnimeModel({
    @HiveField(15) int? age,
    @HiveField(2) dynamic uz,
    @HiveField(20) dynamic ru,
    @HiveField(3) String? slug,
    @HiveField(0) List? keywords,
    @HiveField(5) dynamic studio,
    @HiveField(21) int? duration,
    @HiveField(22) String? video,
    @HiveField(4) dynamic country,
    @HiveField(14) String? trailer,
    @HiveField(6) dynamic director,
    @HiveField(9) dynamic categories,
    @HiveField(18) DateTime? createdAt,
    @HiveField(19) DateTime? updatedAt,
    @HiveField(8) List<GenreModel>? genres,
    @HiveField(7) List<ItemModel>? creators,
    @HiveField(1) @JsonKey(name: "_id") String? id,
    @HiveField(23) @JsonKey(name: "mediaType") AnimeType? type,
    @HiveField(17) @JsonKey(name: "for_only_mdh") bool? forOnlyMDH,
    @HiveField(10) @JsonKey(name: "published_year") int? publishedYear,
    @HiveField(16) @JsonKey(name: "total_episodes") int? totalEpisodes,
    @HiveField(11) @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? thumbnail,
    @HiveField(12) @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String? cover,
    @HiveField(13) @JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String>? images,
  }) = _AnimeModel;

  factory AnimeModel.fromJson(dynamic json) => (json is String) ? AnimeModel(id: json) : _$AnimeModelFromJson(json);
}
