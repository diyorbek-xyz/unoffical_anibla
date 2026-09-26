import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

part 'anime_type.g.dart';

@HiveType(typeId: 5332)
enum AnimeType {
  @HiveField(0)
  @JsonValue("Movies")
  movie,
  @HiveField(1)
  @JsonValue("Series")
  serie;

  bool get isMovie => this == AnimeType.movie;
  bool get isSerie => this == AnimeType.serie;
  static AnimeType fromString(String str) => str.toLowerCase().contains("movie") ? .movie : .serie;

  @override
  String toString() => toBeginningOfSentenceCase("${name}s");
}
