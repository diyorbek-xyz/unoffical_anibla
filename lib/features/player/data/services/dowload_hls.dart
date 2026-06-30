import 'dart:convert';
import 'dart:io';

import 'package:application/features/player/data/model/download/completed_models.dart';
import 'package:application/features/player/data/model/parser_models.dart';
import 'package:application/features/player/data/services/parse_hls.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadHlsPlaylist {
  static final dio = Dio(BaseOptions(persistentConnection: true));
  static Future<MasterPlaylist> downloadMasterPlaylist(String masterPath, String folderName) async {
    final localDirectory = await getApplicationCacheDirectory();
    final localFolder = Uri.parse(localDirectory.uri.toFilePath()).resolve("downloads/$folderName/").toString();
    final masterDataResponse = await dio.get(masterPath);
    final masterData = masterDataResponse.data;
    final master = ParseHlsPlaylist.parseMaster(data: masterData, downloadUrl: masterPath, localFolder: localFolder);

    await createFolder(master.localUrl);
    final masterFile = File(master.localUrl);
    await masterFile.writeAsString(master.hls);
    return master;
  }

  static Future<MediaPlaylist> downloadMediaPlaylist(Variant variant) async {
    final mediaDataResponse = await dio.get(variant.downloadUrl);
    final mediaData = mediaDataResponse.data;
    final media = ParseHlsPlaylist.parseMedia(data: mediaData, variant: variant);
    await createFolder(media.localUrl);

    final mediaFile = File(media.localUrl);
    await mediaFile.writeAsString(media.hls);
    await createFolder(media.chunks.first.localUrl);
    return media;
  }

  static Future<Response> downloadChunk(Chunk chunk) async {
    return await dio.download(chunk.downloadUrl, chunk.localUrl);
  }

  static Future<void> downloadChunks(
    MediaPlaylist media, {
    int workerCount = 7,
    void Function(int total)? onStart,
    Future Function()? beforeDownloadChunk,
    void Function(double progress, int downloaded)? onDownloadChunk,
    void Function()? onComplete,
  }) async {
    List<Chunk> queue = List.from(media.chunks);
    int total = media.chunks.length - 1;
    int downloaded = 0;
    double progress = 0;
    Future worker() async {
      while (queue.isNotEmpty) {
        if (beforeDownloadChunk != null) await beforeDownloadChunk();
        final chunk = queue.removeLast();
        await downloadChunk(chunk);
        downloaded++;
        progress = downloaded / total;
        if (onDownloadChunk != null) onDownloadChunk(progress * (media.sizeByte / (1024 * 1024)), downloaded);
      }
    }

    if (onStart != null) onStart(total);
    await Future.wait(List.generate(workerCount, (_) => worker()));
    if (onComplete != null) onComplete();
  }

  static Future<void> saveCompleted(DownloadInfos info) async {
    final localUri = Uri.parse(info.localFolderUrl);
    final directory = Directory.fromUri(localUri);
    final state = await directory.stat();
    final fileUri = localUri.resolve("completed.json");
    final file = File.fromUri(fileUri);
    await file.writeAsString(jsonEncode(info.copyWith(size: state.size).toJson()));
  }

  static Future<void> createFolder(String url) async {
    final directory = Directory(excludeFilePath(url));
    if (!(await directory.exists())) {
      await directory.create(recursive: true);
    }
  }

  static String excludeFilePath(String path) {
    if (!path.contains(".")) return path;
    return path.substring(0, path.indexOf(RegExp(r'[^/\\]+$')));
  }

  static Future<void> delete(String url) async {
    final directory = Directory(excludeFilePath(url));
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
  }
}
