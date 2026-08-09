import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:equatable/equatable.dart';

class SavedMedias extends Equatable {
  final List<AnimeEntity> movies;
  final List<AnimeEntity> series;
  const SavedMedias({this.movies = const [], this.series = const []});

  @override
  List<Object?> get props => [movies, series];
}
