import 'package:application/features/animes/presentation/bloc/watch/watch_event.dart';
import 'package:application/features/animes/presentation/bloc/watch/watch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchBloc extends Bloc<WatchEvent, WatchState> {
  WatchBloc() : super(WatchInitial()) {
    on<SetEpisode>(onSetEpisode);
  }

  void onSetEpisode(SetEpisode event, Emitter<WatchState> emit) {
    if (state is WatchDone) {
      final current = (state as WatchDone).currentEpisode;
      if (event.episode.id == current.id) return;
    } else {
      emit(WatchLoading());
    }
    emit(WatchDone(currentEpisode: event.episode));
  }
}
