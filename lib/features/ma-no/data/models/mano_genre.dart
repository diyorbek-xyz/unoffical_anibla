import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_genre.g.dart';
part 'mano_genre.freezed.dart';

@freezed
abstract class ManoGenre with _$ManoGenre {
  const factory ManoGenre({@Default("") @JsonKey(name: "genre_id") String id, @Default("") @JsonKey(name: "name") String title}) =
      _ManoGenre;
  factory ManoGenre.fromJson(Map<String, dynamic> json) => _$ManoGenreFromJson(json);
}
