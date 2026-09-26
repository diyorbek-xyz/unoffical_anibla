import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:equatable/equatable.dart';

class SavedMedias extends Equatable {
  final List<Anime> movies;
  final List<Anime> series;
  const SavedMedias({this.movies = const [], this.series = const []});

  @override
  List<Object?> get props => [movies, series];
}
