import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/episode_usecase.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_event.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteEpisodeBloc extends Bloc<RemoteEpisodeEvent, RemoteEpisodeState> {
  final GetEpisodesUseCase _getEpisodesUseCase;
  RemoteEpisodeBloc(this._getEpisodesUseCase) : super(RemoteEpisodeLoading()) {
    on<GetEpisodes>(onGetEpisodes);
    on<RefreshEpisodes>(onRefreshEpisodes);
  }

  void onGetEpisodes(GetEpisodes event, Emitter<RemoteEpisodeState> emit) async {
    final dataState = await _getEpisodesUseCase(event.params);
    if (dataState is DataSuccess) {
      emit(RemoteEpisodeDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteEpisodeFailed(dataState.exception!));
    }
  }

  void onRefreshEpisodes(RefreshEpisodes event, Emitter<RemoteEpisodeState> emit) async {
    emit(RemoteEpisodeLoading());
    final dataState = await _getEpisodesUseCase(event.params);
    if (dataState is DataSuccess) {
      emit(RemoteEpisodeDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteEpisodeFailed(dataState.exception!));
    }
  }
}
