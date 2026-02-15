import 'package:application/data/models/enums/anime.dart';
import 'package:application/data/models/animes/anime_model.dart';
import 'package:application/data/models/animes/episode_model.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/data/models/animes/season_model.dart';
import 'package:application/domain/entities/other/calendar_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'calendar_model.g.dart';

@HiveType(typeId: 20)
class CalendarModel {
  @HiveField(0)
  final List<ReleaseTimerModel>? timers;
  @HiveField(1)
  final PaginationModel? pagination;
  @HiveField(2)
  final DateTime? day;
  const CalendarModel({this.pagination, this.timers, this.day});

  factory CalendarModel.fromJson(dynamic json, DateTime day) {
    List<ReleaseTimerModel> timers = (json['timers'] as List).map((e) => ReleaseTimerModel.fromJson(e)).toList();
    return CalendarModel(timers: timers, pagination: PaginationModel.fromJson(json['pagination']), day: day);
  }
  CalendarEntity toEntity() {
    return CalendarEntity(day: day, pagination: pagination, releases: timers?.map((timer) => timer.toEntity()).toList());
  }
}

@HiveType(typeId: 21)
class ReleaseTimerModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final TranslatedModel message;
  @HiveField(2)
  final DateTime time;
  @HiveField(3)
  final AnimeModel anime;
  @HiveField(4)
  final SeasonModel season;
  @HiveField(5)
  final EpisodeModel episode;
  @HiveField(6)
  final int totalEpisodes;
  @HiveField(7)
  final AnimeType type;
  const ReleaseTimerModel({
    required this.id,
    required this.message,
    required this.time,
    required this.anime,
    required this.episode,
    required this.season,
    required this.totalEpisodes,
    required this.type,
  });

  factory ReleaseTimerModel.fromJson(dynamic json) {
    return ReleaseTimerModel(
      id: json["_id"],
      message: TranslatedModel(ru: json['ru']['message'], uz: json['uz']['message']),
      time: DateTime.parse(json['time']),
      anime: AnimeModel.fromJson(json['media']),
      season: SeasonModel.fromJson(json['season_id']),
      episode: EpisodeModel.fromJson(json['episode_id']),
      totalEpisodes: json['total_episodes'],
      type: AnimeType.serie,
    );
  }
  TimerEntity toEntity() {
    return TimerEntity(
      id: id,
      anime: anime.toEntity(),
      season: season.toEntity(),
      episode: episode.toEntity(),
      message: message,
      releaseTime: time,
      totalEpisodes: totalEpisodes,
      type: type,
    );
  }
}
