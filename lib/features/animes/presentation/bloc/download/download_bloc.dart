import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/features/animes/presentation/bloc/download/download_event.dart';
import 'package:application/features/animes/presentation/bloc/download/download_state.dart';
import 'package:application/network/download/download_video.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final EpisodeRepository repository;
  DownloadBloc(this.repository) : super(DownloadInitial()) {
    on<StartDownload>(onDownloadVideo);
    on<GetInfoDownload>(onGetDownloadInfo);
  }

  final downloader = VideoDownloader();

  void onGetDownloadInfo(GetInfoDownload event, Emitter<DownloadState> emit) async {
    emit(DownloadGettingInfo());
    late String path;
    if (!event.path.endsWith(".m3u8")) {
      final either = await repository.getVideo(event.path);
      path = either.fold((failure) {
        emit(DownloadFailed(ExceptionMapper.mapFailureToMessage(failure)));
        return failure.message;
      }, (r) => r.file);
    }
    final master = await downloader.getDownloadInfo<HlsMasterPlaylist>(path);
    emit(DownloadInfo(master, path));
  }

  void onDownloadVideo(StartDownload event, Emitter<DownloadState> emit) async {
    emit(DownloadLoading());
    bool isCompleted = false;
    String? filePath;
    final either = await repository.downloadVideo(event.download,event.variant);
    either.fold((failure) => emit(DownloadFailed(ExceptionMapper.mapFailureToMessage(failure))), (
      stream,
    ) {
      stream.listen((state) {
        if (state.isDone) {
          isCompleted = state.isDone;
          filePath = state.localPath;
        }
        emit(Downloading(state: state, stream: stream));
      });
    });
    await Future.doWhile(() async {
      await Future.delayed(Duration(seconds: 1));
      if (isCompleted && filePath != null) {
        emit(DownloadDone(filePath!));
        return false;
      }
      return true;
    });
  }
}
