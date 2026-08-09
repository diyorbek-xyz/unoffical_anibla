import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/models/episode_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'timer_model.g.dart';
part 'timer_model.freezed.dart';

@HiveType(typeId: 4)
@freezed
sealed class TimerModel with _$TimerModel {
  factory TimerModel({
    @HiveField(0) @JsonKey(name: "media") final AnimeModel? anime,
    @HiveField(1) @JsonKey(name: "_id") final String? id,
    @HiveField(4) @JsonKey(name: "mediaType") final AnimeType? type,
    @HiveField(5) @JsonKey(name: "episode_id") final EpisodeModel? episode,
    @HiveField(3) final DateTime? time,
  }) = _TimerModel;

  factory TimerModel.fromJson(Map<String, dynamic> json) => _$TimerModelFromJson(json);
}
