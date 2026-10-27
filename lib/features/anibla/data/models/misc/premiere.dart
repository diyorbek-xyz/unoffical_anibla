import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'premiere.g.dart';
part 'premiere.freezed.dart';

@freezed
@HiveType(typeId: 303)
sealed class Premiere with _$Premiere {
  const Premiere._();
  const factory Premiere({
    @Default(Anime()) @HiveField(0) @JsonKey(name: "media") Anime anime,
    @Default("") @HiveField(1) @JsonKey(name: "_id") String id,
    @Default(MediaType.serie) @HiveField(4) @JsonKey(name: "mediaType") MediaType type,
    @Default(Episode()) @HiveField(5) @JsonKey(name: "episode_id") Episode episode,
    @Default("") @HiveField(3) @JsonKey(name: "time") String date,
    @Default(-1) @HiveField(6) @JsonKey(name: "total_episodes") int totalEpisodes,
  }) = _Premiere;

  DateTime get time => DateTime.tryParse(date) ?? DateTime(2000);

  factory Premiere.fromJson(Map<String, dynamic> json) => _$PremiereFromJson(json);
}
