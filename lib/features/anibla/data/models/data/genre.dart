import 'package:application/features/anibla/data/models/helper/localized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'genre.g.dart';
part 'genre.freezed.dart';

@Freezed(fromJson: true, toJson: true)
@HiveType(typeId: 6)
abstract class Genre with _$Genre {
  const factory Genre({
    @Default("") @HiveField(0) @JsonKey(name: "_id") String id,
    @Default(Localized()) @HiveField(1) @JsonKey(name: "name") Localized title,
    @Default("") @HiveField(2) String slug,
    @Default(false) @HiveField(3) bool status,
  }) = _Genre;

  factory Genre.fromJson(dynamic json) {
    if (json is String) return Genre(id: json);
    return _$GenreFromJson(json);
  }
}
