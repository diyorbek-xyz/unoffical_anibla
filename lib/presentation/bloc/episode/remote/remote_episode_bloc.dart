import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/episode_usecase.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_event.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_state.dart';
import 'package:application/presentation/model/episode_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteEpisodesListBloc extends Bloc<RemoteEpisodesListEvent, RemoteEpisodesListState> {
  final GetEpisodesListUseCase _getEpisodesUseCase;
  RemoteEpisodesListBloc(this._getEpisodesUseCase) : super(RemoteEpisodesListLoading()) {
    on<GetEpisodesList>(onGetEpisodes);
  }

  void onGetEpisodes(GetEpisodesList event, Emitter<RemoteEpisodesListState> emit) async {
    emit(RemoteEpisodesListLoading());
    final dataState = await _getEpisodesUseCase(event.params);
    if (dataState is DataSuccess) {
      final uidata = dataState.data?.map((e) => EpisodeUiModel.fromEntity(e)).toList() ?? [];
      emit(RemoteEpisodesListDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteEpisodesListFailed(dataState.exception!));
    }
  }
}

class RemoteEpisodeDetailsBloc extends Bloc<RemoteEpisodeDetailsEvent, RemoteEpisodeDetailsState> {
  final GetEpisodeDetailsUseCase _getEpisodeDetails;
  RemoteEpisodeDetailsBloc(this._getEpisodeDetails) : super(RemoteEpisodeDetailsLoading());

  void onGetEpisodeDetails(GetEpisodeDetails event, Emitter<RemoteEpisodeDetailsState> emit) async {
    final dataState = await _getEpisodeDetails(event.episodeParams);
    if (dataState is DataSuccess) {
      final uidata = EpisodeUiModel.fromEntity(dataState.data!);
      emit(RemoteEpisodeDetailsDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteEpisodeDetailsFailed(dataState.exception!));
    }
  }
}
