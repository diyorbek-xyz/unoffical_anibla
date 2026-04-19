import 'package:application/network/download/download_video.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';

sealed class DownloadState {
  const DownloadState();
}

final class DownloadInitial extends DownloadState {}

final class DownloadGettingInfo extends DownloadState {}

final class DownloadLoading extends DownloadState {
  const DownloadLoading();
}

final class Downloading extends DownloadState {
  final VideoDownloadState state;
  final Stream<VideoDownloadState> stream;
  const Downloading({required this.state, required this.stream});
}

final class DownloadDone extends DownloadState {
  final String path;
  const DownloadDone(this.path);
}

final class DownloadInfo extends DownloadState {
  final HlsMasterPlaylist master;
  final String masterPath;
  const DownloadInfo(this.master, this.masterPath);
}

final class DownloadFailed extends DownloadState {
  final String message;
  const DownloadFailed(this.message);
}
