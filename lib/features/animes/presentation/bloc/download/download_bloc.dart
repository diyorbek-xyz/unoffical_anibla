import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/domain/repository/episode_repository.dart';
import 'package:application/features/animes/presentation/bloc/download/download_event.dart';
import 'package:application/features/animes/presentation/bloc/download/download_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final EpisodeRepository repository;
  DownloadBloc(this.repository) : super(DownloadInitial()) {
    on<StartDownload>(onDownloadVideo);
    on<GetInfoDownload>(onGetDownloadInfo);
  }

  final parser = HlsPlaylistParser.create();
  final dio = Dio();

  void onGetDownloadInfo(GetInfoDownload event, Emitter<DownloadState> emit) async {
    emit(DownloadGettingInfo());
    String path = event.path;
    if (path.isEmpty) {
      emit(DownloadFailed("Bu animeni yuklab olish uchun obuna sotib olishingiz kerak"));
      return;
    }
    if (!path.endsWith(".m3u8")) {
      final either = await repository.getVideo(getStreamId(path));
      either.fold(
        (failure) => emit(DownloadFailed(ExceptionMapper.mapFailureToMessage(failure))),
        (r) => path = r.file,
      );
    }
    if (path.endsWith(".m3u8")) {
      final hlsFile = await dio.get(path);
      final basePath = path.replaceFirst("index.m3u8", "");
      final extFile = hlsFile.data.toString().replaceAll("./", basePath);
      final playlist = await parser.parseString(Uri.parse(path), extFile);
      emit(DownloadInfo(playlist as HlsMasterPlaylist));
    } else {
      emit(DownloadFailed("Fayl formati notog'ri: ${event.path} != .m3u8"));
    }
  }

  void onDownloadVideo(StartDownload event, Emitter<DownloadState> emit) async {
    emit(DownloadLoading());
    final masterBasePath = event.master.baseUri;
    final variantBasePath = event.variant.url.toString().replaceAll("index.m3u8", "");
    String path = event.variant.url.toString().replaceAll("./", "$masterBasePath/");
    List<String> downloadPaths = [path];
    final extFile = await dio.get(path);
    final playlist = await parser.parseString(Uri.parse(path), extFile.data);
    playlist as HlsMediaPlaylist;
    downloadPaths.add(path);
    downloadPaths.addAll(playlist.segments.map((e) => variantBasePath + (e.url ?? "")));
    print(downloadPaths.toString());
    emit(DownloadDone());
  }
}
