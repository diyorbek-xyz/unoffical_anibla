import 'package:application/features/animes/data/models/download_model.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class DownloadsLocal {
  Future<DownloadModel?> getVideo(String episodeId);
  Future<void> saveVideo(DownloadModel video);
  Future<void> deleteVideo(String episodeId);
  Future<List<DownloadModel>> getEntries();
}

class DownloadsLocalImpl implements DownloadsLocal {
  final Box<DownloadModel> downloadBox;
  const DownloadsLocalImpl(this.downloadBox);

  @override
  Future<void> deleteVideo(String episodeId) async {
    await downloadBox.delete(episodeId);
  }

  @override
  Future<DownloadModel?> getVideo(String episodeId) async {
    return downloadBox.get(episodeId);
  }

  @override
  Future<void> saveVideo(DownloadModel video) async {
    await downloadBox.put(video.episodeId, video);
  }

  @override
  Future<List<DownloadModel>> getEntries() async {
    return downloadBox.values.toList();
  }
}
