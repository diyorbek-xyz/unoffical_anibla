import 'package:application/data/models/enums/anime.dart';
import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/data/models/animes/season_model.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'episode_model.g.dart';

@HiveType(typeId: 12)
class EpisodeModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final TranslatedModel? title;
  @HiveField(2)
  final int? episodeNumber;
  @HiveField(3)
  final AnimeModel? anime;
  @HiveField(4)
  final SeasonModel? season;
  @HiveField(5)
  final AnimePrice? price;
  @HiveField(6)
  final String? video;
  @HiveField(7)
  final String? slug;
  const EpisodeModel({this.id, this.episodeNumber, this.title, this.anime, this.price, this.video, this.slug, this.season});

  factory EpisodeModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return EpisodeModel(
        id: json['_id'],
        episodeNumber: json['episode_number'],
        title: TranslatedModel(ru: json['ru']['title'], uz: json['uz']['title']),
        anime: AnimeModel.fromJson(json['series_id']),
        season: SeasonModel.fromJson(json['season_id']),
        price: AnimePrice.fromString(json['type'] ?? "paid"),
        video: json['video'],
        slug: json['slug'],
      );
    }
    if (json is String) {
      return EpisodeModel(id: json);
    }
    throw Exception("Invalid json format: $json");
  }
  EpisodeEntity toEntity() {
    return EpisodeEntity(
      id: id,
      anime: anime?.toEntity(),
      animeId: anime?.id,
      season: season?.toEntity(),
      seasonId: season?.id,
      episodeNumber: episodeNumber,
      price: price,
      slug: slug,
      title: title,
      video: video,
    );
  }
}
