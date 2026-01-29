import 'package:application/models/translated.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'category.g.dart';

@HiveType(typeId: 6)
class Category {
  @HiveField(0)
  final Translated title;
  @HiveField(1)
  final String id;
  const Category({required this.title, required this.id});

  factory Category.fromJson(dynamic json) {
    if (json is String) {
      return Category(
        title: Translated(rus: json, uz: json),
        id: json,
      );
    }
    if (json is Map) {
      return Category(
        title: Translated(rus: json['nameru'] ?? "?", uz: json['nameuz'] ?? "?"),
        id: json['_id'] ?? "?",
      );
    }
    return Category(
      title: Translated(rus: "?", uz: "?"),
      id: "?",
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': id, 'nameru': title.rus, 'nameuz': title.uz};
  }
}

@HiveType(typeId: 7)
class Genre {
  @HiveField(0)
  final Translated title;
  @HiveField(1)
  final String id;
  const Genre({required this.id, required this.title});

  factory Genre.fromJson(dynamic json) {
    if (json is String) {
      return Genre(id: json, title: Translated.fromJson(json));
    }
    if (json is Map) {
      return Genre(
        id: json['_id'],
        title: Translated(rus: json['nameru'], uz: json['nameuz']),
      );
    }
    return Genre(
      id: '?',
      title: Translated(rus: "?", uz: "?"),
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': id, 'nameru': title.rus, 'nameuz': title.uz};
  }
}
