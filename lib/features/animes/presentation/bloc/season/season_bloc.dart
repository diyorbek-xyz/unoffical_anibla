import 'package:application/features/animes/domain/repository/season_repository.dart';
import 'package:application/features/animes/presentation/bloc/season/season_event.dart';
import 'package:application/features/animes/presentation/bloc/season/season_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  final SeasonRepository seasonRepository;
  SeasonBloc(this.seasonRepository) : super(SeasonInitial()) {
    on<GetAllSeasons>(onGetAllSeasons);
  }
  void onGetAllSeasons(GetAllSeasons event, Emitter<SeasonState> emit) async {
    emit(SeasonLoading());
    final either = await seasonRepository.getAllSeasons(event.animeSlug);
    either.fold(
      (failure) =>
          emit(SeasonFailure(ExceptionMapper.mapFailureToMessage(failure))),
      (seasons) => emit(SeasonSuccess(seasons)),
    );
  }
}
