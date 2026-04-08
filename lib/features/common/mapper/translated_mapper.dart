import 'package:application/features/common/data/models/translated.dart';
import 'package:application/features/common/domain/entities/translated_entity.dart';

class TranslatedMapper {
  static Translated modelToEntity(TranslatedModel? model) =>
      Translated(ru: model?.ru ?? "ru", uz: model?.uz ?? "uz");
  static Translated nullableToEntity({String? ru, String? uz}) =>
      Translated(ru: ru ?? "ru", uz: uz ?? "uz");
  static Translated extendedToEntity(dynamic model, String key) =>
      Translated(ru: model?.ru?[key] ?? "ru", uz: model?.uz?[key] ?? "uz");
}
