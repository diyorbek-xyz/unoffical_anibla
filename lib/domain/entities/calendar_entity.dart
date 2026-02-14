import 'package:application/data/models/enums/anime.dart';
import 'package:application/domain/entities/anime_entity.dart';
import 'package:application/domain/entities/episode_entity.dart';
import 'package:application/domain/entities/season_entity.dart';
import 'package:application/domain/entities/translated_entity.dart';
import 'package:equatable/equatable.dart';

class TimerEntity extends Equatable {
  final String? id;
  final TranslatedEntity? message;
  final DateTime? releaseTime;
  final AnimeEntity? anime;
  final SeasonEntity? season;
  final EpisodeEntity? episode;
  final int? totalEpisodes;
  final AnimeType? type;
  const TimerEntity({this.id, this.anime, this.episode, this.message, this.releaseTime, this.season, this.totalEpisodes, this.type});

  @override
  List<Object?> get props => [id, message, releaseTime, anime, season, episode, totalEpisodes, type];
}

class PaginationEntity extends Equatable {
  final int? total;
  final int? limit;
  final int? page;
  final int? pages;
  const PaginationEntity({this.total, this.limit, this.page, this.pages});

  @override
  List<Object?> get props => [total, limit, page, pages];
}

class CalendarEntity extends Equatable {
  final List<TimerEntity>? releases;
  final PaginationEntity? pagination;
  final DateTime? day;

  const CalendarEntity({this.day, this.pagination, this.releases});

  @override
  List<Object?> get props => [releases, pagination, day];
}
