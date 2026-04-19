import 'package:application/features/animes/domain/entities/download_entity.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';

sealed class DownloadEvent {
  const DownloadEvent();
}

final class GetInfoDownload extends DownloadEvent {
  final String path;
  const GetInfoDownload(this.path);
}

final class StartDownload extends DownloadEvent {
  final DownloadEntity download;
  final Variant variant;
  const StartDownload(this.download, this.variant);
}

final class PauseDownload extends DownloadEvent {
  final String downloadId;
  const PauseDownload(this.downloadId);
}

final class CancelDownload extends DownloadEvent {
  final String downloadId;
  const CancelDownload(this.downloadId);
}
