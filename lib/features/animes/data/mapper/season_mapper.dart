import 'package:application/features/animes/data/models/season_model.dart';
import 'package:application/features/animes/domain/entities/season_entity.dart';
import 'package:application/features/common/mapper/translated_mapper.dart';

class SeasonMapper {
  SeasonEntity modelToEntity(SeasonModel model) => SeasonEntity(
    id: model.id ?? "",
    slug: model.slug ?? "",
    title: TranslatedMapper.extendedToEntity(model, "title"),
  );

  SeasonModel entityToModel(SeasonEntity entity) => SeasonModel(
    id: entity.id,
    slug: entity.slug,
    ru: {"title": entity.title.ru},
    uz: {"title": entity.title.uz},
  );
}
