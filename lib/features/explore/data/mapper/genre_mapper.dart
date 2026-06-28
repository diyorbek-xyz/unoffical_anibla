import 'package:application/features/common/data/models/helpers/translated.dart';
import 'package:application/features/common/mapper/translated_mapper.dart';
import 'package:application/features/explore/data/models/genre_model.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';

class GenreMapper {
  static GenreEntity modelToEntity(GenreModel? model) => GenreEntity(
    id: model?.id ?? "",
    slug: model?.slug ?? "",
    title: TranslatedMapper.modelToEntity(model?.title),
    status: model?.status ?? false,
  );
  static GenreModel entityToModel(GenreEntity? entity) => GenreModel(
    id: entity?.id ?? "",
    slug: entity?.slug ?? "",
    title: TranslatedModel(ru: entity?.title.ru, uz: entity?.title.uz),
    status: entity?.status ?? false,
  );
}
