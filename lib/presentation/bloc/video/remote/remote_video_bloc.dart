import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/video_usecase.dart';
import 'package:application/presentation/bloc/video/remote/remote_video_event.dart';
import 'package:application/presentation/bloc/video/remote/remote_video_state.dart';
import 'package:application/presentation/model/episode_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteVideoBloc extends Bloc<RemoteVideoEvent, RemoteVideoState> {
  final GetVideoUsecase _getVideoUsecase;

  RemoteVideoBloc(this._getVideoUsecase) : super(RemoteVideoLoading()) {
    on<GetVideo>(onGetVideo);
  }

  void onGetVideo(GetVideo event, Emitter<RemoteVideoState> emit) async {
    final dataState = await _getVideoUsecase(event.source);
    if (dataState is DataSuccess) {
      final uidata = VideoUiModel.fromEntity(dataState.data!);
      emit(RemoteVideoDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteVideoFailed(dataState.exception!));
    }
  }
}
