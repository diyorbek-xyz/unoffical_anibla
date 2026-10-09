import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'media_type.g.dart';

@HiveType(typeId: 1002)
enum MediaType {
  @HiveField(0)
  @JsonValue("Movies")
  movie,
  @HiveField(1)
  @JsonValue("Series")
  serie,
  @HiveField(2)
  @JsonValue("manga")
  manga,
  @HiveField(3)
  @JsonValue("manhwa")
  manxva,
  @HiveField(4)
  @JsonValue("novella")
  novel,
  @HiveField(5)
  @JsonValue("komiks")
  comics;

  bool get isAnime => this == .movie || this == .serie;
  bool get isBook => this == .manga || this == .manxva || this == .novel || this == .comics;
  bool get isMovie => this == .movie;
  bool get isSerie => this == .serie;
  bool get isManga => this == .manga;
  bool get isManxva => this == .manxva;
  bool get isComics => this == .comics;
  bool get isNovel => this == .novel;

  String get jsonValue => switch (this) {
    .comics => "komiks",
    .manga => "manga",
    .manxva => "manhwa",
    .movie => "movies",
    .novel => "novella",
    .serie => "series",
  };

  @override
  toString() => switch (this) {
    .comics => "Komiks",
    .manga => "Manga",
    .manxva => "Manxva",
    .novel => "Novella",
    .movie => "Film",
    .serie => "Seriya",
  };
}
