import 'package:application/features/player/data/model/download_models.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

abstract class DownloadsLocal {
  Future<void> saveDownload(String episodeId, DownloadTask download);
  Future<void> removeDownload(String episodeId);
  DownloadTask? getDownload(String episodeId);
  Map<dynamic, DownloadTask>? getAllDownloads();
}

class DownloadsLocalImpl implements DownloadsLocal {
  final Box<DownloadTask> box;
  const DownloadsLocalImpl(this.box);

  @override
  DownloadTask? getDownload(String episodeId) {
    return box.get(episodeId);
  }

  @override
  Future<void> removeDownload(String episodeId) async {
    await box.delete(episodeId);
  }

  @override
  Future<void> saveDownload(String episodeId, DownloadTask download) async {
    await box.put(episodeId, download);
  }

  @override
  Map<String, DownloadTask>? getAllDownloads() {
    return box.toMap().cast<String, DownloadTask>();
  }
}
