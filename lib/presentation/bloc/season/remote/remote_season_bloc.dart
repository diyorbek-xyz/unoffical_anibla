import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/entities/season_entity.dart';
import 'package:application/domain/usecases/season_usecase.dart';
import 'package:application/presentation/bloc/season/remote/remote_season_event.dart';
import 'package:application/presentation/bloc/season/remote/remote_season_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonsProvider extends ChangeNotifier {
  final GetSeasonsUseCase getSeasons;
  SeasonsProvider(this.getSeasons);

  bool isLoading = false;
  List<SeasonEntity> seasons = [];

  Future<void> fetchSeasons({String animeSlug = ""}) async {
    isLoading = true;
    notifyListeners();

    seasons.clear();
    final result = await getSeasons(GetSeasonsParams(animeSlug: animeSlug));
    if (result is DataSuccess) {
      seasons.addAll(result.data ?? []);
    }
    isLoading = true;
    notifyListeners();
  }
}

class SeasonProvider extends ChangeNotifier {
  final GetSeasonBySlugUseCase getSeasonBySlug;
  SeasonProvider(this.getSeasonBySlug);
  bool isLoading = false;
  String? error;
  SeasonEntity season = SeasonEntity();
  Future<void> fetchSeasonBySlug(GetSeasonParams params) async {
    isLoading = true;
    notifyListeners();
    final result = await getSeasonBySlug(params);
    if (result is DataSuccess) {
      season = result.data!;
    } else if (result is DataFailed) {
      error = result.exception.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

class RemoteSeasonBloc extends Bloc<RemoteSeasonEvent, RemoteSeasonState> {
  final GetSeasonBySlugUseCase _getSeasonBySlugUseCase;
  final GetSeasonsUseCase _getSeasonsUseCase;
  RemoteSeasonBloc(this._getSeasonBySlugUseCase, this._getSeasonsUseCase) : super(RemoteSeasonsLoading()) {
    on<GetSeasons>(onGetSeasons);
    on<GetSeasonBySlug>(onGetSeasonBySlug);
  }

  void onGetSeasons(GetSeasons event, Emitter<RemoteSeasonState> emit) async {
    final dataState = await _getSeasonsUseCase(event.params);
    if (dataState is DataSuccess) {
      emit(RemoteSeasonsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteSeasonsFailed(dataState.exception!));
    }
  }

  void onGetSeasonBySlug(GetSeasonBySlug event, Emitter<RemoteSeasonState> emit) async {
    final dataState = await _getSeasonBySlugUseCase(event.params);
    if (dataState is DataSuccess) {
      emit(RemoteSeasonDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteSeasonsFailed(dataState.exception!));
    }
  }
}
