import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/entities/episode_entity.dart';
import 'package:application/domain/usecases/episode_usecase.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_event.dart';
import 'package:application/presentation/bloc/episode/remote/remote_episode_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeProvider extends ChangeNotifier {
  final GetEpisodesUseCase getEpisodes;
  EpisodeProvider(this.getEpisodes);

  bool isLoading = false;
  String? error;
  List<EpisodeEntity> episodes = [];
  Future<void> fetchEpisodes(GetEpisodesParams params) async {
    isLoading = true;
    notifyListeners();
    final result = await getEpisodes(params);
    if (result is DataSuccess) {
      episodes.addAll(result.data ?? []);
    } else if (result is DataFailed) {
      error = result.exception.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

class RemoteEpisodeBloc extends Bloc<RemoteEpisodeEvent, RemoteEpisodeState> {
  final GetEpisodesUseCase _getEpisodesUseCase;
  RemoteEpisodeBloc(this._getEpisodesUseCase) : super(RemoteEpisodeLoading()) {
    on<GetEpisodes>(onGetEpisodes);
  }

  void onGetEpisodes(GetEpisodes event, Emitter<RemoteEpisodeState> emit) async {
    final dataState = await _getEpisodesUseCase(event.params);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteEpisodeDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteEpisodeFailed(dataState.exception!));
    }
  }
}
