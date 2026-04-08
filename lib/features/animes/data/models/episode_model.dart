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

  const EpisodeModel({
    this.episodeNumber,
    this.id,
    this.ru,
    this.slug,
    this.uz,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
