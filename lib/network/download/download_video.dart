import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:path_provider/path_provider.dart';

class VideoDownloadState {
  final String status;
  final double progress;
  final String? localPath;
  final bool isDone;
  const VideoDownloadState({
    required this.status,
    required this.progress,
    this.isDone = false,
    this.localPath,
  });
}

class VideoInfos {
  final Uri masterUri;
  final Uri masterLocalUri;
  final Uri variantUri;
  final Uri variantLocalUri;
  final Uri downloadUri;
  final int total;
  final List<String> segmentsDowloadPaths;
  const VideoInfos({
    required this.downloadUri,
    required this.masterLocalUri,
    required this.masterUri,
    required this.variantLocalUri,
    required this.segmentsDowloadPaths,
    required this.variantUri,
    required this.total,
  });
}

class VideoDownloader {
  final parser = HlsPlaylistParser.create();
  final dio = Dio();

  Future<Uri> createVideoFolder({required String folderName}) async {
    final directory = await getApplicationCacheDirectory();
    final path = "${directory.path}/$folderName/";
    final dir = Directory(path);
    if (!await dir.exists()) await dir.create(recursive: true);
    return Uri.parse(path);
  }

  Future<T> getDownloadInfo<T>(String path) async {
    if (!path.endsWith(".m3u8")) throw Exception("No'tog'ri format");
    final hlsFile = await dio.get(path);
    final playlist = await parser.parseString(Uri(), hlsFile.data);
    return playlist as T;
  }

  void downloadSegments({
    required List<String> paths,
    required Uri variantUri,
    required Uri variantLocalUri,
    required Function(double progress) onLoading,
    required Function onDone,
    required int concurreny,
  }) {
    int total = paths.length;
    double completed = 0;
    final queue = List<String>.from(paths);

    void startWorker() async {
      while (queue.isNotEmpty) {
        final path = queue.removeAt(0);
        final networkpath = variantUri.resolve(path).toString();
        final localPath = variantLocalUri.resolve(path).toString();
        try {
          double old = 0;
          await dio.download(
            networkpath,
            localPath,
            onReceiveProgress: (count, dtotal) {
              final progress = count / dtotal;
              completed += (progress - old);
              onLoading(completed / total);
              old = progress;
            },
            deleteOnError: true,
          );
          if (completed >= total) {
            onDone();
          }
        } catch (e) {
          throw Exception(e.toString());
        }
      }
    }

    for (var i = 0; i < concurreny; i++) {
      startWorker();
    }
  }

  Future<VideoInfos> getVideoInfos({
    required String masterPath,
    required String folderName,
    required Variant selectedVariant,
  }) async {
    final downloadUri = await createVideoFolder(folderName: folderName);
    final variant = selectedVariant;
    final masterUri = Uri.parse(masterPath);

    final variantUri = masterUri.resolve(variant.url.path);
    final variantPlaylist = await getDownloadInfo<HlsMediaPlaylist>(variantUri.toString());
    final segments = variantPlaylist.segments.where((e) => e.url != null).toList();

    final masterLocalUri = downloadUri.resolve(masterUri.pathSegments.last);
    final variantLocalUri = downloadUri.resolve(variant.url.path);
    final segmentsDowloadPaths = segments.map((e) => e.url!).toList();
    return VideoInfos(
      total: segments.length + 2,
      downloadUri: downloadUri,
      segmentsDowloadPaths: segmentsDowloadPaths,
      masterUri: masterUri,
      masterLocalUri: masterLocalUri,
      variantUri: variantUri,
      variantLocalUri: variantLocalUri,
    );
  }

  Stream<VideoDownloadState> downloadVideo({
    required String masterPath,
    required String folderName,
    required Variant selectedVariant,
    Function(String localPath)? onDownloaded,
    Function(double progress)? onDownloading,
  }) async* {
    final controller = StreamController<VideoDownloadState>();

    Future downloadMaster(VideoInfos info) async {
      controller.add(
        VideoDownloadState(status: "Downloading master playlist", progress: 1 / info.total),
      );
      await dio.downloadUri(info.masterUri, info.masterLocalUri.toString());
    }

    Future downloadVariant(VideoInfos info) async {
      controller.add(VideoDownloadState(status: "Downloading playlist", progress: 2 / info.total));
      await dio.downloadUri(info.variantUri, info.variantLocalUri.toString());
    }

    void downloadSegment(VideoInfos info) {
      downloadSegments(
        variantUri: info.variantUri,
        paths: info.segmentsDowloadPaths,
        variantLocalUri: info.variantLocalUri,
        concurreny: 10,
        onDone: () {
          if (onDownloaded != null) onDownloaded(info.masterLocalUri.toString());
          controller.add(
            VideoDownloadState(
              status: "Download $folderName completed",
              progress: 1,
              localPath: info.masterLocalUri.toString(),
              isDone: true,
            ),
          );
        },
        onLoading: (progress) {
          if (onDownloading != null) onDownloading(progress);
          controller.add(
            VideoDownloadState(
              status: "Downloading segments: ${(progress * 100).toStringAsFixed(2)}%",
              progress: progress,
              isDone: false,
            ),
          );
        },
      );
    }

    Future<void> downloadAll(VideoInfos infos) async {
      await downloadMaster(infos);
      await downloadVariant(infos);
      downloadSegment(infos);
    }

    getVideoInfos(
      masterPath: masterPath,
      folderName: folderName,
      selectedVariant: selectedVariant,
    ).then(downloadAll);
    yield* controller.stream;
  }
}
