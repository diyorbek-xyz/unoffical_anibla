import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/features/explore/presentation/bloc/search/search_event.dart';
import 'package:application/features/explore/presentation/bloc/search/search_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ExploreRepository repository;
  SearchBloc(this.repository) : super(SearchInitial()) {
    on<SearchAnime>(onSearchAnime);
  }
  void onSearchAnime(SearchAnime event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    if (event.isEmpty) return emit(SearchInitial());
    final series = await repository.searchAnime(AnimeType.serie.toLowerCase(), event.query);
    final movies = await repository.searchAnime(AnimeType.movie.toLowerCase(), event.query);
    List<AnimeEntity> serieAnimes = [];
    List<AnimeEntity> movieAnimes = [];
    series.fold((failure) => emit(SearchFailed(ExceptionMapper.mapFailureToMessage(failure))), (r) {
      serieAnimes.addAll(r);
    });
    movies.fold((failure) => emit(SearchFailed(ExceptionMapper.mapFailureToMessage(failure))), movieAnimes.addAll);
    if (state is! SearchFailed) {
      emit(SearchFound(search: event.search ?? "", series: serieAnimes, movies: movieAnimes));
    }
  }
}
