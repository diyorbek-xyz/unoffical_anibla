import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/models/season_model.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 531)
class EpisodeModel {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String? id;
  @HiveField(1)
  final dynamic uz;
  @HiveField(2)
  final dynamic ru;
  @HiveField(3)
  final String? slug;
  @HiveField(4)
  @JsonKey(name: "episode_number")
  final int? episodeNumber;
  @HiveField(5)
  final String? type;
  @HiveField(6)
  final String? video;
  @HiveField(7)
  @JsonKey(name: "series_id")
  final AnimeModel? anime;
  @HiveField(8)
  @JsonKey(name: "season_id")
  final SeasonModel? season;

  const EpisodeModel({this.episodeNumber, this.id, this.ru, this.slug, this.uz, this.type, this.video, this.season, this.anime});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
