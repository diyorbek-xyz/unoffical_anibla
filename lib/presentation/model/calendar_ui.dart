import 'package:application/data/models/enums/anime.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/entities/animes/season_entity.dart';
import 'package:application/domain/entities/common/pagination_entity.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/other/calendar_entity.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:application/presentation/model/episode_ui.dart';
import 'package:application/presentation/model/pagination_ui.dart';
import 'package:application/presentation/model/season_ui.dart';
import 'package:application/presentation/model/translated_ui.dart';

class TimerUiModel {
  final String id;
  final TranslatedUiModel message;
  final DateTime releaseTime;
  final AnimeUiModel anime;
  final SeasonUiModel season;
  final EpisodeUiModel episode;
  final int totalEpisodes;
  final AnimeType type;

  const TimerUiModel({
    required this.id,
    required this.anime,
    required this.episode,
    required this.message,
    required this.releaseTime,
    required this.season,
    required this.totalEpisodes,
    required this.type,
  });
  factory TimerUiModel.fromEntity(TimerEntity timer) {
    return TimerUiModel(
      id: timer.id ?? "id",
      anime: AnimeUiModel.fromEntity(timer.anime ?? AnimeEntity()),
      episode: EpisodeUiModel.fromEntity(timer.episode ?? EpisodeEntity()),
      season: SeasonUiModel.fromEntity(timer.season ?? SeasonEntity()),
      message: TranslatedUiModel.fromEntity(timer.message ?? TranslatedEntity()),
      releaseTime: timer.releaseTime ?? DateTime.now(),
      totalEpisodes: timer.totalEpisodes ?? 1,
      type: AnimeType.serie,
    );
  }
}

class CalendarUiModel {
  final List<TimerUiModel> releases;
  final PaginationUiModel pagination;
  final DateTime day;

  const CalendarUiModel({required this.day, required this.pagination, required this.releases});

  factory CalendarUiModel.fromEntity(CalendarEntity calendar) {
    return CalendarUiModel(
      day: calendar.day ?? DateTime.now(),
      pagination: PaginationUiModel.fromEntity(calendar.pagination ?? PaginationEntity()),
      releases: calendar.releases?.map((e) => TimerUiModel.fromEntity(e)).toList() ?? [],
    );
  }
}
