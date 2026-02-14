import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/anime_usecase.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_event.dart';
import 'package:application/presentation/bloc/anime/remote/remote_anime_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteAnimeBloc extends Bloc<RemoteAnimeEvent, RemoteAnimeState> {
  final GetAnimesUseCase _getAnimesUseCase;

  RemoteAnimeBloc(this._getAnimesUseCase) : super(RemoteAnimeLoading()) {
    on<GetAnimes>(onGetAnimes);
  }

  void onGetAnimes(GetAnimes event, Emitter<RemoteAnimeState> emit) async {
    final dataState = await _getAnimesUseCase(event.params);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteAnimeDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteAnimeFailed(dataState.exception!));
    }
  }
}
