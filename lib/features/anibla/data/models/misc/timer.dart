import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'timer.g.dart';
part 'timer.freezed.dart';

@freezed
@HiveType(typeId: 4)
sealed class Timer with _$Timer {
  const Timer._();
  const factory Timer({
    @Default(Anime()) @HiveField(0) @JsonKey(name: "media") Anime anime,
    @Default("") @HiveField(1) @JsonKey(name: "_id") String id,
    @Default(AnimeType.serie) @HiveField(4) @JsonKey(name: "mediaType") AnimeType type,
    @Default(Episode()) @HiveField(5) @JsonKey(name: "episode_id") Episode episode,
    @Default("") @HiveField(3) String date,
  }) = _Timer;

  DateTime get time => DateTime.tryParse(date) ?? DateTime(2000);

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}
