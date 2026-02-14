import 'package:application/data/models/common/miscs_model.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'filter_model.g.dart';

@HiveType(typeId: 23)
class CategoryModel {
  @HiveField(0)
  final TranslatedModel title;
  @HiveField(1)
  final String id;

  const CategoryModel({required this.title, required this.id});

  factory CategoryModel.fromJson(dynamic json, {dynamic anime}) {
    if (json is String) {
      return CategoryModel(
        title: TranslatedModel(ru: json, uz: json),
        id: json,
      );
    }
    if (json is Map) {
      return CategoryModel(
        title: TranslatedModel(ru: json['nameru'] ?? "?", uz: json['nameuz'] ?? "?"),
        id: json['_id'] ?? "?",
      );
    }
    return CategoryModel(
      title: TranslatedModel(ru: "?", uz: "?"),
      id: "?",
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': id, 'nameru': title.ru, 'nameuz': title.uz};
  }
}

@HiveType(typeId: 24)
class GenreModel {
  @HiveField(0)
  final TranslatedModel title;
  @HiveField(1)
  final String id;
  const GenreModel({required this.id, required this.title});

  factory GenreModel.fromJson(dynamic json) {
    if (json is String) {
      return GenreModel(id: json, title: TranslatedModel.fromJson(json));
    }
    if (json is Map) {
      return GenreModel(
        id: json['_id'],
        title: TranslatedModel(ru: json['nameru'], uz: json['nameuz']),
      );
    }
    return GenreModel(
      id: '?',
      title: TranslatedModel(ru: "?", uz: "?"),
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': id, 'nameru': title.ru, 'nameuz': title.uz};
  }
}
