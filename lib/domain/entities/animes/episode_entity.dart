import 'package:application/data/models/enums/anime.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/entities/animes/season_entity.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String? file;
  final int? introStart;
  final int? introEnd;

  const VideoEntity({this.file, this.introEnd, this.introStart});

  @override
  List<Object?> get props => [file, introEnd, introStart];
}

class EpisodeEntity extends Equatable {
  final String? id;
  final TranslatedEntity? title;
  final String? slug;
  final String? animeId;
  final String? seasonId;
  final AnimeEntity? anime;
  final SeasonEntity? season;
  final AnimePrice? price;
  final int? episodeNumber;
  final String? video;

  const EpisodeEntity({
    this.id,
    this.title,
    this.slug,
    this.anime,
    this.animeId,
    this.season,
    this.seasonId,
    this.price,
    this.episodeNumber,
    this.video,
  });

  @override
  List<Object?> get props => [id, title, slug, animeId, anime, seasonId, season, price, episodeNumber, video];
}
