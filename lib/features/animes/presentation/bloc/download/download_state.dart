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
  final double progress;
  final String speedStr;
  const Downloading({required this.progress, required this.speedStr});
}

final class DownloadDone extends DownloadState {}

final class DownloadInfo extends DownloadState {
  final HlsMasterPlaylist master;
  const DownloadInfo(this.master);
}

final class DownloadFailed extends DownloadState {
  final String message;
  const DownloadFailed(this.message);
}
