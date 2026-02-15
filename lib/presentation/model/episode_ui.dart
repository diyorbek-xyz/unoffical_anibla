import 'package:application/data/models/enums/anime.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/domain/entities/animes/episode_entity.dart';
import 'package:application/domain/entities/animes/season_entity.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:application/presentation/model/season_ui.dart';
import 'package:application/presentation/model/translated_ui.dart';

class EpisodeUiModel {
  final String id;
  final TranslatedUiModel title;
  final String slug;
  final String animeId;
  final String seasonId;
  final AnimeUiModel anime;
  final SeasonUiModel season;
  final AnimePrice price;
  final int episodeNumber;
  final String video;

  const EpisodeUiModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.anime,
    required this.animeId,
    required this.season,
    required this.seasonId,
    required this.price,
    required this.episodeNumber,
    required this.video,
  });

  factory EpisodeUiModel.fromEntity(EpisodeEntity episode) {
    return EpisodeUiModel(
      id: episode.id ?? "id",
      title: TranslatedUiModel.fromEntity(episode.title ?? TranslatedEntity()),
      slug: episode.slug ?? "slug",
      animeId: episode.animeId ?? episode.anime?.id ?? "animeId",
      seasonId: episode.seasonId ?? episode.season?.id ?? "seasonId",
      anime: AnimeUiModel.fromEntity(episode.anime ?? AnimeEntity()),
      season: SeasonUiModel.fromEntity(episode.season ?? SeasonEntity()),
      episodeNumber: episode.episodeNumber ?? 0,
      price: episode.price ?? AnimePrice.paid,
      video: episode.video ?? "",
    );
  }
}

class VideoUiModel {
  final String file;
  final int introStart;
  final int introEnd;

  const VideoUiModel({required this.file, required this.introEnd, required this.introStart});

  factory VideoUiModel.fromEntity(VideoEntity video) {
    return VideoUiModel(file: video.file ?? "file", introEnd: video.introEnd ?? 1, introStart: video.introStart ?? 0);
  }
}
