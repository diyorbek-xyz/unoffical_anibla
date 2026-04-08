import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_event.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository animeRepository;
  AnimeBloc(this.animeRepository) : super(AnimeInitial()) {
    on<GetSerie>(onGetSerie);
  }

  void onGetSerie(GetSerie event, Emitter<AnimeState> emit) async {
    emit(AnimeLoading());
    final either = await animeRepository.getSerie(event.slug);
    either.fold(
      (failure) {
        emit(AnimeFilure(ExceptionMapper.mapFailureToMessage(failure)));
      },
      (data) {
        emit(AnimeSuccess(data));
      },
    );
  }
}
