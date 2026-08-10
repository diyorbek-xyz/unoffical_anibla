import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/common/presentation/controller/signal_state.dart';
import 'package:application/features/explore/data/mapper/genre_mapper.dart';
import 'package:application/features/explore/data/models/search_query.dart';
import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ExploreController {
  final ExploreRepository repository;
  ExploreController(this.repository);

  final fakeGenres = List.generate(4, (index) => GenreMapper.modelToEntity(null));
  late final genresSignal = futureSignal(() async {
    final either = await repository.getGenres();
    return either.getData();
  });

  late final historySignal = futureSignal(() async {
    final either = await repository.getHistoy();
    return either.getData();
  });
  final searchSignal = signal(SignalState<Searched>());

  Future<void> deleteFromHistory(String id) async {
    await repository.deleteFromHistory(id);
    await historySignal.refresh();
  }

  Future<void> searchAnime(SearchQuery query) async {
    if (query.isEmpty) {
      searchSignal.set(SignalState<Searched>());
      return;
    }

    searchSignal.set(searchSignal.value.setLoading(true));

    String? error;
    final series = await repository.searchAnime(AnimeType.serie, query);
    final movies = await repository.searchAnime(AnimeType.movie, query);

    List<AnimeEntity> serieAnimes = [];
    List<AnimeEntity> movieAnimes = [];
    series.fold((f) => error = ExceptionMapper.mapFailureToMessage(f), serieAnimes.addAll);
    movies.fold((f) => error = ExceptionMapper.mapFailureToMessage(f), movieAnimes.addAll);

    if (error != null) {
      searchSignal.set(searchSignal.value.withError(error!));
    } else {
      searchSignal.set(searchSignal.value.withValue(Searched(search: query.search ?? "", series: serieAnimes, movies: movieAnimes)));
    }
  }

  Future<void> refreshAll() async {
    await genresSignal.refresh();
    await historySignal.refresh();
  }
}

final class Searched {
  final String search;
  final List<AnimeEntity> series;
  final List<AnimeEntity> movies;
  const Searched({required this.search, required this.series, required this.movies});

  factory Searched.empty() => Searched(search: "", series: [], movies: []);
}
