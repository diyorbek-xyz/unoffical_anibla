import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/domain/entities/season_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'season_model.g.dart';

@HiveType(typeId: 11)
class SeasonModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final TranslatedModel title;
  @HiveField(2)
  final int seasonNumber;
  @HiveField(3)
  final AnimeModel? anime;
  @HiveField(4)
  final String? animeId;
  @HiveField(5)
  final String? slug;
  const SeasonModel({required this.id, required this.seasonNumber, required this.title, required this.anime, this.slug, this.animeId});

  factory SeasonModel.fromJson(dynamic json) {
    return SeasonModel(
      id: json['_id'],
      seasonNumber: int.tryParse(json['slug']) ?? 0,
      title: TranslatedModel(ru: json['ru']['title'], uz: json['uz']['title']),
      anime: json['series_id'] is Map ? AnimeModel.fromJson(json['series_id']) : null,
      slug: json['slug'],
      animeId: json['series_id'] is String ? json['series_id'] : null,
    );
  }
  SeasonEntity toEntity() {
    return SeasonEntity(id: id, slug: slug, title: title, anime: anime?.toEntity(), animeId: animeId);
  }
}
