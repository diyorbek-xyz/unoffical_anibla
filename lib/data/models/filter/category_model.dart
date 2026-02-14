import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/filter/category_entity.dart';
import 'package:hive_ce/hive_ce.dart';

part 'category_model.g.dart';

@HiveType(typeId: 61)
class CategoryModel extends CategoryEntity {
  @HiveField(0)
  @override
  String? get id => super.id;
  @HiveField(1)
  @override
  TranslatedEntity? get name => super.name;
  @HiveField(2)
  @override
  String? get slug => super.slug;
  const CategoryModel({super.id, super.name, super.slug});

  factory CategoryModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return CategoryModel(id: json['_id'], name: TranslatedModel.fromJson(json['name']), slug: json['slug']);
    }
    if (json is String) {
      return CategoryModel(id: json);
    }
    throw Exception('Invalid json format: $json');
  }
}
