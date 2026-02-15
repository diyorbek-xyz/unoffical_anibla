import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/season_usecase.dart';
import 'package:application/presentation/bloc/season/remote/remote_season_event.dart';
import 'package:application/presentation/bloc/season/remote/remote_season_state.dart';
import 'package:application/presentation/model/season_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteSeasonsListBloc extends Bloc<RemoteSeasonEvent, RemoteSeasonsListState> {
  final GetSeasonsListUseCase _getSeasonsUseCase;
  RemoteSeasonsListBloc(this._getSeasonsUseCase) : super(RemoteSeasonsListLoading()) {
    on<GetSeasons>(onGetSeasons);
  }

  void onGetSeasons(GetSeasons event, Emitter<RemoteSeasonsListState> emit) async {
    final dataState = await _getSeasonsUseCase(event.params);
    if (dataState is DataSuccess) {
      final uidata = dataState.data?.map((e) => SeasonUiModel.fromEntity(e)).toList() ?? [];
      emit(RemoteSeasonsListDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteSeasonsListFailed(dataState.exception!));
    }
  }
}

class RemoteSeasonDetailsBloc extends Bloc<RemoteSeasonDetailsEvent, RemoteSeasonDetailsState> {
  final GetSeasonDetailsUseCase _getSeasonDetailsUseCase;
  RemoteSeasonDetailsBloc(this._getSeasonDetailsUseCase) : super(RemoteSeasonDetailsLoading()) {
    on<GetSeasonDetails>(onGetSeasonDetails);
  }
  void onGetSeasonDetails(GetSeasonDetails event, Emitter<RemoteSeasonDetailsState> emit) async {
    final dataState = await _getSeasonDetailsUseCase(event.getSeasonParams);
    if (dataState is DataSuccess) {
      final uidata = SeasonUiModel.fromEntity(dataState.data!);
      emit(RemoteSeasonDetailsDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteSeasonDetailsFailed(dataState.exception!));
    }
  }
}
