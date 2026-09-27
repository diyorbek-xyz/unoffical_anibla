import 'package:application/features/anibla/data/enums/episode_type.dart';
import 'package:application/features/anibla/data/models/helper/localized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'episode.g.dart';
part 'episode.freezed.dart';

@freezed
@HiveType(typeId: 202)
abstract class Episode with _$Episode {
  const Episode._();
  const factory Episode({
    @Default("") @HiveField(0) @JsonKey(name: "_id") String id,
    @Default(0) @HiveField(1) @JsonKey(name: "episode_number") int episodeNumber,
    @Default({}) @HiveField(2) dynamic uz,
    @Default({}) @HiveField(3) dynamic ru,
    @Default("") @HiveField(4) String slug,
    @Default(EpisodeType.paid) @HiveField(5) EpisodeType type,
    @Default("") @HiveField(6) String video,
  }) = _Episode;

  Localized get title => Localized(ru: ru['title'], uz: uz['title']);

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
}
