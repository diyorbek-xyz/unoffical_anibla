import 'package:application/features/animes/domain/entities/anime_entity.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {
  const SearchInitial();
}

final class SearchLoading extends SearchState {
  const SearchLoading();
}

final class SearchFailed extends SearchState {
  final String message;
  const SearchFailed(this.message);
}

final class SearchFound extends SearchState {
  final String search;
  final List<AnimeEntity> series;
  final List<AnimeEntity> movies;
  const SearchFound({required this.search, required this.series, required this.movies});
}
