import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/data/creator.dart';
import 'package:application/features/anibla/data/models/data/genre.dart';
import 'package:application/features/anibla/data/models/helper/localized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'anime.g.dart';
part 'anime.freezed.dart';

@freezed
@HiveType(typeId: 205)
abstract class Anime with _$Anime {
  const Anime._();
  const factory Anime({
    @Default({}) @HiveField(2) Map<String, dynamic> uz,
    @Default({}) @HiveField(3) Map<String, dynamic> ru,
    @Default(0) @HiveField(1) int age,
    @Default("") @HiveField(4) String slug,
    @Default([]) @HiveField(5) List keywords,
    @Default({}) @HiveField(6) dynamic studio,
    @Default(0) @HiveField(7) int duration,
    @Default("") @HiveField(8) String video,
    @Default({}) @HiveField(9) dynamic country,
    @Default("") @HiveField(10) String trailer,
    @Default({}) @HiveField(11) dynamic director,
    @Default([]) @HiveField(12) dynamic categories,
    @Default("") @HiveField(13) String createdDate,
    @Default("") @HiveField(14) String updatedDate,
    @Default([]) @HiveField(15) List<Genre> genres,
    @Default([]) @HiveField(16) List<Creator> creators,
    @Default("") @HiveField(17) @JsonKey(name: "_id") String id,
    @Default(AnimeType.serie) @HiveField(18) @JsonKey(name: "mediaType") AnimeType type,
    @Default(false) @HiveField(19) @JsonKey(name: "for_only_mdh") bool forOnlyMDH,
    @Default(0) @HiveField(20) @JsonKey(name: "published_year") int publishedYear,
    @Default(0) @HiveField(21) @JsonKey(name: "total_episodes") int totalEpisodes,
    @Default("") @HiveField(22) @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String thumbnail,
    @Default("") @HiveField(23) @JsonKey(fromJson: addBaseUrl, includeFromJson: true) String cover,
    @Default([]) @HiveField(24) @JsonKey(fromJson: addBaseUrlAsList, includeFromJson: true) List<String> images,
  }) = _Anime;
  Localized get title => Localized(ru: ru['title'] ?? "", uz: uz['title'] ?? "");
  Localized get description => Localized(ru: ru['description'] ?? "", uz: uz['description'] ?? "");
  DateTime get createdAt => DateTime.tryParse(createdDate) ?? DateTime.now();
  DateTime get updatedAt => DateTime.tryParse(createdDate) ?? DateTime.now();

  factory Anime.fromJson(dynamic json) => (json is String) ? Anime(id: json) : _$AnimeFromJson(json);
}
