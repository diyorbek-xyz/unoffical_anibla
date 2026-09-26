import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_anime.g.dart';
part 'saved_anime.freezed.dart';

@freezed
abstract class SavedAnime with _$SavedAnime {
  const SavedAnime._();
  factory SavedAnime({
    @Default("") @JsonKey(name: "_id") String id,
    @Default("") @JsonKey(name: "user_id") String userId,
    @Default(Anime()) @JsonKey(name: "media") Anime anime,
    @Default("") @JsonKey(name: "last_visited") String lastVisitedDate,
  }) = _SavedAnime;
  DateTime get lastVisitedAt => DateTime.tryParse(lastVisitedDate) ?? DateTime.now();

  factory SavedAnime.fromJson(Map<String, dynamic> json) => _$SavedAnimeFromJson(json);
}

class SavedAnimes extends Equatable {
  final List<Anime> movies;
  final List<Anime> series;
  const SavedAnimes({this.movies = const [], this.series = const []});

  @override
  List<Object?> get props => [movies, series];
}
