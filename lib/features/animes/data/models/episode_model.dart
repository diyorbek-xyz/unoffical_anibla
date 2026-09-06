import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'episode_model.g.dart';
part 'episode_model.freezed.dart';

@freezed
@HiveType(typeId: 531)
abstract class EpisodeModel with _$EpisodeModel {
  const EpisodeModel._();
  factory EpisodeModel({
    @HiveField(0) @JsonKey(name: "_id") final String? id,
    @HiveField(1) final dynamic uz,
    @HiveField(2) final dynamic ru,
    @HiveField(3) final String? slug,
    @HiveField(4) @JsonKey(name: "episode_number") final int? episodeNumber,
    @HiveField(5) final String? type,
    @HiveField(6) final String? video,
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);
}
