import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/anime_usecase.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_event.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_state.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteAnimesListBloc extends Bloc<RemoteAnimesListEvent, RemoteAnimesListState> {
  final GetAnimesListUseCase _getAnimesUseCase;

  RemoteAnimesListBloc(this._getAnimesUseCase) : super(RemoteAnimesListLoading()) {
    on<GetAnimesList>(onGetAnimes);
    on<RefreshAnimesList>(onRefreshAnimes);
  }

  void onGetAnimes(GetAnimesList event, Emitter<RemoteAnimesListState> emit) async {
    final dataState = await _getAnimesUseCase(event.params);
    if (dataState is DataSuccess) {
      final uidata = dataState.data?.map((e) => AnimeUiModel.fromEntity(e)).toList() ?? [];
      emit(RemoteAnimesListDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteAnimesListFailed(dataState.exception!));
    }
  }

  void onRefreshAnimes(RefreshAnimesList event, Emitter<RemoteAnimesListState> emit) async {
    emit(RemoteAnimesListLoading());
    final dataState = await _getAnimesUseCase(event.params);
    if (dataState is DataSuccess) {
      final uidata = dataState.data?.map((e) => AnimeUiModel.fromEntity(e)).toList() ?? [];
      emit(RemoteAnimesListDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteAnimesListFailed(dataState.exception!));
    }
  }
}

class RemoteAnimeDetailsBloc extends Bloc<RemoteAnimeDetailsEvent, RemoteAnimeDetailsState> {
  final GetAnimeDetailsUseCase _getAnimeDetailsUseCase;
  RemoteAnimeDetailsBloc(this._getAnimeDetailsUseCase) : super(RemoteAnimeDetailsLoading()) {
    on<GetAnimeDetails>(onGetAnimeDetails);
  }

  void onGetAnimeDetails(GetAnimeDetails event, Emitter<RemoteAnimeDetailsState> emit) async {
    final dataState = await _getAnimeDetailsUseCase(event.params);
    if (dataState is DataSuccess) {
      final uidata = AnimeUiModel.fromEntity(dataState.data!);
      emit(RemoteAnimeDetailsDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteAnimeDetailsFailed(dataState.exception!));
    }
  }
}
