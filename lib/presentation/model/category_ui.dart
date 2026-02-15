import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/filter/category_entity.dart';
import 'package:application/presentation/model/translated_ui.dart';

class CategoryUiModel {
  final String id;
  final TranslatedUiModel name;
  final String slug;
  const CategoryUiModel({required this.id, required this.name, required this.slug});

  factory CategoryUiModel.fromEntity(CategoryEntity entity) {
    return CategoryUiModel(
      id: entity.id ?? "id",
      name: TranslatedUiModel.fromEntity(entity.name ?? TranslatedEntity()),
      slug: entity.slug ?? "slug",
    );
  }
}
