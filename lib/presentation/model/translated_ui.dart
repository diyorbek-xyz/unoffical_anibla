import 'package:application/domain/entities/common/translated_entity.dart';

class TranslatedUiModel {
  final String uz;
  final String ru;
  const TranslatedUiModel({required this.ru, required this.uz});

  factory TranslatedUiModel.fromEntity(TranslatedEntity translated) {
    return TranslatedUiModel(ru: translated.ru ?? "ruscha", uz: translated.uz ?? "uzbekcha");
  }
}
