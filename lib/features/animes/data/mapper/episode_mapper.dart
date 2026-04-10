import 'package:application/features/animes/data/models/episode_model.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/common/mapper/translated_mapper.dart';

class EpisodeMapper {
  static EpisodeEntity modelToEntity(EpisodeModel? model) => EpisodeEntity(
    episodeNumber: model?.episodeNumber ?? 0,
    id: model?.id ?? "",
    slug: model?.slug ?? "",
    video: model?.video ?? "",
    type: model?.type ?? EpisodeType.paid,
    title: TranslatedMapper.extendedToEntity(model, 'title'),
  );

  static EpisodeModel entityToModel(EpisodeEntity? entity) => EpisodeModel(
    episodeNumber: entity?.episodeNumber,
    id: entity?.id,
    slug: entity?.slug,
    uz: {"title": entity?.title.uz},
    ru: {"title": entity?.title.ru},
  );
}
