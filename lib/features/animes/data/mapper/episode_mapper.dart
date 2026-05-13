import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/mapper/season_mapper.dart';
import 'package:application/features/animes/data/models/episode_model.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/common/mapper/translated_mapper.dart';

class EpisodeMapper {
  static EpisodeEntity modelToEntity(EpisodeModel? model, {bool? isDownloaded, String? video}) => EpisodeEntity(
    season: SeasonMapper.modelToEntity(model?.season),
    anime: AnimeMapper.modelToEntity(model?.anime),
    episodeNumber: model?.episodeNumber ?? 0,
    id: model?.id ?? "",
    slug: model?.slug ?? "",
    video: video ?? model?.video ?? "",
    type: model?.type ?? EpisodeType.paid,
    isDownloaded: isDownloaded ?? false,
    title: TranslatedMapper.extendedToEntity(model, 'title'),
  );

  static EpisodeModel entityToModel(EpisodeEntity? entity) => EpisodeModel(
    episodeNumber: entity?.episodeNumber,
    id: entity?.id,
    slug: entity?.slug,
    anime: AnimeMapper.entityToModel(entity?.anime),
    season: SeasonMapper.entityToModel(entity?.season),
    type: entity?.type,
    video: entity?.video,
    uz: {"title": entity?.title.uz},
    ru: {"title": entity?.title.ru},
  );
  static Map<String, dynamic> entityToMediaInfo(EpisodeEntity entity) => {"title": entity.title.uz, "episode": entity.episodeNumber};
}
