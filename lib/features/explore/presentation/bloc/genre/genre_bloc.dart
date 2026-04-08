import 'package:application/features/explore/domain/repository/explore_repository.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_event.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final ExploreRepository repository;
  GenreBloc(this.repository) : super(GenreLoading()) {
    on<GetGenres>(onGetTemplate);
  }
  void onGetTemplate(GetGenres event, Emitter<GenreState> emit) async {
    if (state is! GenresFullSuccess) emit(GenreLoading());
    final either = await repository.getGenres();
    either.fold(
      (failure) => emit(GenreError(ExceptionMapper.mapFailureToMessage(failure))),
      (data) => emit(GenresFullSuccess(data)),
    );
  }
}
