import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/param_models/search_params.dart';
import 'package:application/domain/usecases/search_usecase.dart';
import 'package:application/presentation/bloc/search/search_event.dart';
import 'package:application/presentation/bloc/search/search_state.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchAnimesUsecase _searchAnimesUsecase;
  SearchBloc(this._searchAnimesUsecase) : super(SearchInitialState()) {
    on<SearchAnimes>(onSearchAnimes);
    on<SearchClear>(onClearSearch);
  }

  void onSearchAnimes(SearchAnimes event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    final serieDataState = await _searchAnimesUsecase(
      SearchParams(type: "series", query: event.query, limit: event.limit, page: event.page),
    );
    final movieDataState = await _searchAnimesUsecase(
      SearchParams(type: "movies", query: event.query, limit: event.limit, page: event.page),
    );
    if (serieDataState is DataSuccess && movieDataState is DataSuccess) {
      if ((serieDataState.data!.isEmpty && movieDataState.data!.isEmpty) || (serieDataState.data == null && movieDataState.data == null)) {
        emit(SearchEmptyState());
      } else {
        final series = serieDataState.data!.map((e) => AnimeUiModel.fromEntity(e)).toList();
        final movies = movieDataState.data!.map((e) => AnimeUiModel.fromEntity(e)).toList();
        emit(SearchSuccessState(series: series, movies: movies));
      }
    }
    if (serieDataState is DataFailed || movieDataState is DataFailed) {
      emit(SearchFailedState(exception: serieDataState.exception ?? movieDataState.exception!));
    }
  }

  void onClearSearch(SearchClear event, Emitter<SearchState> emit) {
    emit(SearchInitialState());
  }
}
