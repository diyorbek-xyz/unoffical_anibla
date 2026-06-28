import 'package:application/features/player/data/model/download/completed_models.dart';
import 'package:application/features/player/data/model/parser_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:rxdart/rxdart.dart';

part 'download_models.g.dart';
part 'download_models.freezed.dart';

enum DownloadStatus { downloading, paused, completed, cancelled }

@HiveType(typeId: 7365)
@freezed
sealed class DownloadState with _$DownloadState {
  const DownloadState._();
  factory DownloadState({
    @HiveField(0) required final String id,
    @HiveField(1) required final int downloaded,
    @HiveField(2) required final int total,
    @HiveField(3) required final double speed,
    @HiveField(4) required final DownloadStatus status,
    @HiveField(5) required final int bandwidth,
    @HiveField(6) required final double duration,
  }) = _DownloadState;

  double get progress => total == 0 ? 0 : downloaded / total;
  double get downloadedSize => progress * ((duration * bandwidth) / (8 * 1024 * 1024));
  double get totalSize => (duration * bandwidth) / (8 * 1024 * 1024);
}

@HiveType(typeId: 1541)
@freezed
sealed class DownloadTask with _$DownloadTask {
  const DownloadTask._();
  factory DownloadTask({
    @HiveField(0) required final MasterPlaylist masterPlaylist,
    @HiveField(1) required final MediaPlaylist mediaPlaylist,
    @HiveField(2) required final DownloadInfos infos,
    @HiveField(4) @Default(false) bool isCompleted,
    final BehaviorSubject<DownloadState>? streamController,
  }) = _DownloadTask;

  int get total => mediaPlaylist.chunks.length;
  List<Chunk> get queue => mediaPlaylist.chunks;
  double get sizeByte => mediaPlaylist.sizeByte;
  String get id => infos.episodeId;
}
