import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:application/features/common/data/models/helpers/translated.dart';
import 'package:application/features/explore/data/mapper/genre_mapper.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class GenreModel {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String? id;
  @HiveField(1)
  @JsonKey(name: "name")
  final TranslatedModel? title;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final bool? status;
  const GenreModel({this.id, this.slug, this.title, this.status});

  factory GenreModel.fromJson(dynamic json) {
    if (json is String) return GenreModel(id: json);
    return _$GenreModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}

@JsonSerializable()
class GenreResponse {
  final List<GenreModel> genres;
  final Pagination pagination;
  const GenreResponse({required this.genres, required this.pagination});

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);

  List<GenreEntity> getEntities() => genres.map(GenreMapper.modelToEntity).toList();
}
