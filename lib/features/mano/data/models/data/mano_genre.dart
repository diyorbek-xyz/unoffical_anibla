import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'mano_genre.g.dart';
part 'mano_genre.freezed.dart';

@freezed
@HiveType(typeId: 7345)
abstract class ManoGenre with _$ManoGenre {
  const factory ManoGenre({
    @HiveField(0) @Default("") @JsonKey(name: "genre_id") String id,
    @HiveField(1) @Default("") @JsonKey(name: "name") String title,
  }) = _ManoGenre;
  factory ManoGenre.fromJson(Map<String, dynamic> json) => _$ManoGenreFromJson(json);
}
