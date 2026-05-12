import 'package:application/features/player/data/model/parser_models.dart';
import 'package:application/features/player/data/services/parse_hls.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'download_models.g.dart';

enum DownloadStatus { downloading, paused, completed, cancelled }

@HiveType(typeId: 7365)
class DownloadState {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int downloaded;
  @HiveField(2)
  final int total;
  @HiveField(3)
  final double speed;
  @HiveField(4)
  final DownloadStatus status;

  const DownloadState({required this.id, required this.downloaded, required this.total, required this.speed, required this.status});

  double get progress => total == 0 ? 0 : downloaded / total;

  DownloadState copyWith({int? downloaded, int? total, double? speed, DownloadStatus? status, String? id}) => DownloadState(
    downloaded: downloaded ?? this.downloaded,
    total: total ?? this.total,
    speed: speed ?? this.speed,
    status: status ?? this.status,
    id: id ?? this.id,
  );
}

@HiveType(typeId: 1541)
class DownloadTask {
  @HiveField(0)
  final String id;
  @HiveField(2)
  final MasterPlaylist masterPlaylist;
  @HiveField(3)
  final MediaPlaylist mediaPlaylist;
  @HiveField(4)
  List<Chunk> queue;
  DownloadTask({required this.id, required this.mediaPlaylist, required this.masterPlaylist, required this.queue});

  @HiveField(5)
  ExtraInfos get extraInfo => ParseHlsPlaylist.getExtraInfos(variant: masterPlaylist.variants.last, media: mediaPlaylist);

  @HiveField(6)
  int total = 20;
}
