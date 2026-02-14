import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/domain/entities/common/translated_entity.dart';
import 'package:application/domain/entities/filter/genre_entity.dart';
import 'package:hive_ce/hive_ce.dart';

part 'genre_model.g.dart';

@HiveType(typeId: 60)
class GenreModel extends GenreEntity {
  @HiveField(0)
  @override
  String? get id => super.id;
  @HiveField(1)
  @override
  TranslatedEntity? get name => super.name;
  @HiveField(2)
  @override
  String? get slug => super.slug;
  const GenreModel({super.id, super.name, super.slug});

  factory GenreModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return GenreModel(id: json['_id'], name: TranslatedModel.fromJson(json['name']), slug: json['slug']);
    }
    if (json is String) {
      return GenreModel(id: json);
    }
    throw Exception('Invalid json format: $json');
  }
}
