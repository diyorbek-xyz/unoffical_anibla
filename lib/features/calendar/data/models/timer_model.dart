import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/models/episode_model.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timer_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class TimerModel {
  @HiveField(0)
  @JsonKey(name: "media")
  final AnimeModel? anime;

  @HiveField(1)
  @JsonKey(name: "_id")
  final String? id;

  @HiveField(3)
  final DateTime? time;

  @HiveField(4)
  @JsonKey(name: "mediaType")
  final String? type;

  @HiveField(5)
  @JsonKey(name: "episode_id")
  final EpisodeModel? episode;

  const TimerModel({this.anime, this.id, this.time, this.type, this.episode});

  factory TimerModel.fromJson(Map<String, dynamic> json) =>
      _$TimerModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimerModelToJson(this);
}
