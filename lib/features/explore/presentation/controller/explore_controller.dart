import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/common/presentation/controller/signal_state.dart';
import 'package:application/features/explore/data/mapper/genre_mapper.dart';
import 'package:application/features/explore/data/models/search_query.dart';
import 'package:application/features/explore/data/source/local/search_history_local.dart';
import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ExploreController {
  final ExploreRepository repository;
  final SearchHistoryLocal _searchHistoryLocal;
  ExploreController(this.repository, this._searchHistoryLocal);

  final fakeGenres = List.generate(4, (index) => GenreMapper.modelToEntity(null));
  late final genresSignal = futureSignal(() async {
    final either = await repository.getGenres();
    return either.getData();
  });

  late final historySignal = futureSignal(() async {
    final either = await repository.getHistoy();
    return either.getData();
  });

  Future<void> deleteFromHistory(String id) async {
    await repository.deleteFromHistory(id);
    await historySignal.refresh();
  }

  late final searchHistorySignal = futureSignal(_searchHistoryLocal.getHistory);
  Future<void> deleteFromSearch(String id) async {
    await _searchHistoryLocal.deleteFromHistory(id);
    await searchHistorySignal.refresh();
  }

  final searchSignal = signal(SignalState<Searched>());

  Future<void> searchAnime(SearchQuery query) async {
    if (query.isEmpty) {
      searchSignal.set(SignalState<Searched>());
      return;
    }
    searchSignal.set(searchSignal.value.setLoading(true));

    String? error;
    if (query.search != null && query.search!.isNotEmpty) await _searchHistoryLocal.saveToHistory(query.search!);
    final series = await repository.searchAnime(.serie, query);
    final movies = await repository.searchAnime(.movie, query);

    List<AnimeEntity> serieAnimes = [];
    List<AnimeEntity> movieAnimes = [];
    series.fold((f) => error = ExceptionMapper.mapFailureToMessage(f), serieAnimes.addAll);
    movies.fold((f) => error = ExceptionMapper.mapFailureToMessage(f), movieAnimes.addAll);

    if (error != null) {
      searchSignal.set(searchSignal.value.withError(error!));
    } else {
      searchSignal.set(searchSignal.value.withValue(Searched(search: query.search ?? "", series: serieAnimes, movies: movieAnimes)));
    }
    await searchHistorySignal.refresh();
  }

  Future<void> refreshAll() async {
    await genresSignal.refresh();
    await historySignal.refresh();
    await searchHistorySignal.refresh();
  }
}

final class Searched {
  final String search;
  final List<AnimeEntity> series;
  final List<AnimeEntity> movies;
  const Searched({required this.search, required this.series, required this.movies});

  factory Searched.empty() => Searched(search: "", series: [], movies: []);
}
