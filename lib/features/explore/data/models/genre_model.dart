import 'package:application/features/anibla/data/models/data/genre.dart';
import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:application/features/common/data/models/helpers/translated.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreResponse {
  final List<Genre> genres;
  final Pagination pagination;
  const GenreResponse({required this.genres, required this.pagination});

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}
