import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/features/animes/presentation/bloc/video/video_event.dart';
import 'package:application/features/animes/presentation/bloc/video/video_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final EpisodeRepository repository;
  VideoBloc(this.repository) : super(VideoInitial()) {
    on<GetVideo>(onGetVideo);
    on<SetVideoIsPaid>(onSetPaid);
  }

  void onGetVideo(GetVideo event, Emitter<VideoState> emit) async {
    emit(VideoLoading());
    final either = await repository.getVideo(getStreamId(event.url));
    either.fold(
      (failure) => emit(VideoFailure(ExceptionMapper.mapFailureToMessage(failure))),
      (r) => emit(VideoSuccess(r)),
    );
  }

  void onSetPaid(SetVideoIsPaid event, Emitter<VideoState> emit) async {
    emit(VideoIsPaid());
  }
}
