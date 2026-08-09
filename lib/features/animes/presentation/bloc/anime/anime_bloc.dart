import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/repository/anime_repository.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/common/data/models/helpers/paginator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_event.dart';
part 'anime_bloc.freezed.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository animeRepository;
  AnimeBloc(this.animeRepository) : super(AnimeInitial()) {
    on<_GetSingle>(onGetSerie);
    on<_GetHome>(onGetHome);
    on<_GetMore>(onGetMore);
  }

  void onGetSerie(_GetSingle event, Emitter<AnimeState> emit) async {
    emit(AnimeLoading());
    final either = await animeRepository.getSerie(event.type, event.slug);
    either.fold(
      (failure) {
        emit(AnimeFilure(ExceptionMapper.mapFailureToMessage(failure)));
      },
      (data) {
        emit(AnimeSuccess(data));
      },
    );
  }

  void onGetHome(_GetHome event, Emitter<AnimeState> emit) async {
    emit(AnimeLoading());
    final either = await animeRepository.getHomeAnimes(event.paginator);
    either.fold(
      (failure) {
        emit(AnimeFilure(ExceptionMapper.mapFailureToMessage(failure)));
      },
      (data) {
        emit(HomeAnimesSuccess(data.datas, data.pagination));
      },
    );
  }

  void onGetMore(_GetMore event, Emitter<AnimeState> emit) async {
    if (state is! HomeAnimesSuccess) return;
    final animes = state as HomeAnimesSuccess;
    if (!animes.pagination.hasMore) return;
    final either = await animeRepository.getHomeAnimes(Paginator(limit: animes.pagination.limit, page: animes.pagination.page + 1));
    either.fold(
      (failure) {
        emit(AnimeFilure(ExceptionMapper.mapFailureToMessage(failure)));
      },
      (data) {
        emit(HomeAnimesSuccess([...animes.animes, ...data.datas], data.pagination));
      },
    );
  }
}
