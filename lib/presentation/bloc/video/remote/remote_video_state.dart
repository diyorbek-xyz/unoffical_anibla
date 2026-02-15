import 'package:application/presentation/model/episode_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteVideoState extends Equatable {
  final VideoUiModel? video;
  final DioException? exception;
  const RemoteVideoState({this.video, this.exception});
  @override
  List<Object?> get props => [video, exception];
}

final class RemoteVideoLoading extends RemoteVideoState {
  const RemoteVideoLoading();
}

final class RemoteVideoDone extends RemoteVideoState {
  const RemoteVideoDone(VideoUiModel video) : super(video: video);
}

final class RemoteVideoFailed extends RemoteVideoState{
  const RemoteVideoFailed(DioException exception):super(exception: exception);
}