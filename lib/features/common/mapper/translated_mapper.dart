import 'package:application/features/common/data/models/helpers/translated.dart';
import 'package:application/features/common/domain/entities/translated_entity.dart';

class TranslatedMapper {
  static TranslatedModel entityToModel(Translated entity) => TranslatedModel(ru: entity.ru, uz: entity.uz);
  static Translated modelToEntity(TranslatedModel? model) => Translated(ru: model?.ru ?? "ru", uz: model?.uz ?? "uz");
  static Translated nullableToEntity({String? ru, String? uz}) => Translated(ru: ru ?? "ru", uz: uz ?? "uz");
  static Translated extendedToEntity(dynamic model, String key) => Translated(ru: model?.ru?[key] ?? "ru", uz: model?.uz?[key] ?? "uz");
}
