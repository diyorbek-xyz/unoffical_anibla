import 'dart:async';

import 'package:application/core/utils/utils.dart';
import 'package:application/features/animes/data/models/video_model.dart';
import 'package:application/features/player/data/model/download/completed_models.dart';
import 'package:application/features/player/data/model/parser_models.dart';
import 'package:application/features/player/data/model/service/download_models.dart';
import 'package:application/features/player/data/services/dowload_hls.dart';
import 'package:application/features/player/data/source/local/downloads.dart';
import 'package:application/injection_container.dart';
import 'package:rxdart/rxdart.dart';

class HlsDownloadService {
  final DownloadsLocal storage;
  HlsDownloadService(this.storage);

  Map<String, DownloadState> states = {};
  DownloadTask? getTask(String id) => storage.getDownload(id);

  Future<VideoModel> getUrlFromStream(String stream) async {
    final response = await dio.get(stream, queryParameters: {"format": "api"});
    final video = VideoModel.fromJson(response.data);
    if (video.file == null) throw Exception("Invalid stream url");
    return video;
  }

  Future<MasterPlaylist> downloadMasterPlaylist(String url, String localUrl) async {
    final isOnline = await Utils.checkIsOnline();
    if (!isOnline) throw Exception("Enable your wifi or mobile network");
    final master = await DownloadHlsPlaylist.downloadMasterPlaylist(url, localUrl);
    return master;
  }

  Future<DownloadTask> downloadFromStream(DownloadInfos info) async {
    final video = await getUrlFromStream(info.streamUrl);
    if (video.file == null) throw Exception("Invalid stream url");
    return download(info.copyWith(downloadUrl: video.file!));
  }

  Future<DownloadTask> download(DownloadInfos info) async {
    final isOnline = await Utils.checkIsOnline();
    if (!isOnline) throw Exception("Enable your wifi or mobile network");
    final id = info.episodeId;
    final oldState = states[id];
    if (oldState != null && oldState.status != .completed) await cancel(id);
    final master = info.masterPlaylist ?? await DownloadHlsPlaylist.downloadMasterPlaylist(info.downloadUrl, info.localFolderUrl);
    final media = await DownloadHlsPlaylist.downloadMediaPlaylist(info.variant ?? master.variants.last);
    final state = states[id] = DownloadState(
      id: id,
      downloaded: 0,
      total: media.chunks.length,
      speed: 0,
      status: .downloading,
      bandwidth: media.bandwidth,
      duration: media.duration,
    );
    final stream = BehaviorSubject<DownloadState>.seeded(state);
    final task = DownloadTask(streamController: stream, infos: info, masterPlaylist: master, mediaPlaylist: media);
    await storage.saveDownload(id, task);
    start(task);
    task.streamController!.add(state);
    return task;
  }

  Future<void> start(DownloadTask task) async {
    if (task.streamController == null) return;
    List<String> downloads = [];

    await Future.wait(List.generate(4, (_) => _worker(task, downloads)));
    final state = states[task.id]!;
    if (state.status == .cancelled) return;

    _emit(task.id, status: .completed);
    await DownloadHlsPlaylist.saveCompleted(task.infos.copyWith(localFolderUrl: task.masterPlaylist.localUrl));
    await storage.saveDownload(task.id, task.copyWith(isCompleted: true));
  }

  Future<void> _worker(DownloadTask task, List<String> downloads) async {
    final id = task.id;
    while (downloads.length < task.queue.length) {
      final state = states[id];
      if (state == null || state.status == .cancelled) return;
      while (state.status == .paused) {
        final state = states[id];
        if (state?.status != .paused) break;
        await Future.delayed(Duration(milliseconds: 200));
      }
      final segment = task.queue.firstWhere((element) => !downloads.contains(element.localUrl));
      downloads.add(segment.localUrl);
      _emit(id, downloaded: state.downloaded + 1, status: .downloading);
      await DownloadHlsPlaylist.downloadChunk(segment);
      if (state.status == .cancelled) await cancel(id);
    }
  }

  void _emit(String id, {int? downloaded, int? total, double? speed, DownloadStatus? status}) {
    final state = states[id];
    final task = getTask(id);
    if (state == null || task == null || task.streamController == null) return;
    final newState = state.copyWith(
      id: id,
      downloaded: downloaded ?? state.downloaded,
      speed: speed ?? state.speed,
      status: status ?? state.status,
      total: total ?? state.total,
    );
    states[id] = newState;
    task.streamController!.add(newState);
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
}
