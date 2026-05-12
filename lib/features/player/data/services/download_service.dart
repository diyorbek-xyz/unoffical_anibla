import 'dart:async';

import 'package:application/features/animes/data/models/video_model.dart';
import 'package:application/features/player/data/model/download_models.dart';
import 'package:application/features/player/data/services/dowload_hls.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/injection_container.dart';

class HlsDownloadService {
  final DownloadsLocal storage;
  HlsDownloadService(this.storage);
  final _controller = StreamController<DownloadState>.broadcast();

  Stream<DownloadState> get stream => _controller.stream;
  Map<String, DownloadTask> get tasks => storage.getAllDownloads() as Map<String, DownloadTask>? ?? {};
  Map<String, DownloadState> states = {};
  DownloadTask? getTask(String id) => storage.getDownload(id);

  Future<String?> downloadFromStream(String streamPath, String id) async {
    final response = await dio.get(streamPath, queryParameters: {"format": "api"});
    final video = VideoModel.fromJson(response.data);
    if (video.file != null) return download(id, video.file!);
    return null;
  }

  Future<String> download(String id, String masterPath) async {
    final state = states[id];
    if (state != null && state.status != .completed) await cancel(id);

    final master = await DownloadHlsPlaylist.downloadMasterPlaylist(masterPath, id);
    final media = await DownloadHlsPlaylist.downloadMediaPlaylist(master.variants.last);
    final task = DownloadTask(id: id, masterPlaylist: master, mediaPlaylist: media, queue: media.chunks);
    states[id] = DownloadState(id: id, downloaded: 0, total: media.chunks.length, speed: 0, status: .downloading);

    await storage.saveDownload(id, task);
    start(task);
    return id;
  }

  Future<void> start(DownloadTask task) async {
    final state = states[task.id]!;
    task.queue = task.mediaPlaylist.chunks.reversed.toList();

    _controller.add(state);
    final stopwatch = Stopwatch()..start();
    _speedWorker(task, stopwatch);
    await Future.wait(List.generate(4, (index) => _worker(task, stopwatch)));
    _emit(task.id, status: .completed);
  }

  Future<void> _worker(DownloadTask task, Stopwatch stopwatch) async {
    while (task.queue.isNotEmpty) {
      final state = states[task.id];
      if (state == null || state.status == .cancelled) return;
      while (state.status == .paused) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      final segment = task.queue.removeLast();
      _emit(task.id, downloaded: state.downloaded + 1, status: .downloading);
      await DownloadHlsPlaylist.downloadChunk(segment);
    }
  }

  Future<void> _speedWorker(DownloadTask task, Stopwatch sw) async {
    while (task.queue.isNotEmpty) {
      _emit(task.id, speed: _speed(task, sw));
      await Future.delayed(Duration(seconds: 1));
    }
  }

  double _speed(DownloadTask task, Stopwatch sw) {
    if (sw.elapsedMilliseconds == 0) return 0;
    final state = states[task.id]!;
    final downloadedSegment = (state.downloaded / (sw.elapsedMilliseconds / 1000));
    final byte = (downloadedSegment * task.mediaPlaylist.targetDuration * task.extraInfo.bandwidth) / (8 * 1024);
    return byte;
  }

  void _emit(String id, {int? downloaded, int? total, double? speed, DownloadStatus? status}) {
    final state = states[id];
    if (state == null) return;
    final newState = state.copyWith(downloaded: downloaded, id: id, speed: speed, status: status, total: total);
    states[id] = newState;
    _controller.add(newState);
  }

  void toggle(String id) {
    final state = states[id];
    if (state == null) return;
    if (state.status == .paused) return resume(id);
    pause(id);
  }

  void pause(String id) {
    _emit(id, status: .paused);
  }

  void resume(String id) {
    _emit(id, status: .downloading);
  }

  Future<void> cancel(String id) async {
    final task = storage.getDownload(id);
    if (task == null) return;
    final folder = task.masterPlaylist.localUrl;
    _emit(task.id, status: .cancelled, downloaded: 0, speed: 0);
    await storage.removeDownload(id);
    await DownloadHlsPlaylist.delete(folder);
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}
