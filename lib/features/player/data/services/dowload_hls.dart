import 'dart:io';

import 'package:application/features/player/data/model/parser_models.dart';
import 'package:application/features/player/data/services/parse_hls.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadHlsPlaylist {
  static final dio = Dio();
  static Future<MasterPlaylist> downloadMasterPlaylist(String masterPath, String folderName) async {
    final localDirectory = await getApplicationCacheDirectory();
    final localFolder = Uri.parse(localDirectory.uri.toFilePath()).resolve("downloads/$folderName/").toString();
    final masterDataResponse = await dio.get(masterPath);
    final masterData = masterDataResponse.data;
    final master = ParseHlsPlaylist.parseMaster(data: masterData, downloadUrl: masterPath, localFolder: localFolder);

    await createFolder(master.localUrl);
    final masterFile = File(master.localUrl);
    await masterFile.writeAsString(master.toHLS());
    return master;
  }

  static Future<MediaPlaylist> downloadMediaPlaylist(Variant variant) async {
    final mediaDataResponse = await dio.get(variant.downloadUrl);
    final mediaData = mediaDataResponse.data;
    final media = ParseHlsPlaylist.parseMedia(data: mediaData, downloadUrl: variant.downloadUrl, localFolder: variant.localUrl);
    await createFolder(media.localUrl);

    final mediaFile = File(media.localUrl);
    await mediaFile.writeAsString(media.toHLS());
    await createFolder(media.chunks.first.localUrl);
    return media;
  }

  static Future<Response> downloadChunk(Chunk chunk) async {
    return await dio.download(chunk.downloadUrl, chunk.localUrl);
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
