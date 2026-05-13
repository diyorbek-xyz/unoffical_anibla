import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/player/data/model/parser_models.dart';
import 'package:application/features/player/data/services/parse_hls.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

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
  final DownloaderProps props;
  @HiveField(1)
  final MasterPlaylist masterPlaylist;
  @HiveField(2)
  final MediaPlaylist mediaPlaylist;
  @HiveField(3)
  List<Chunk> queue;
  @HiveField(4)
  final DownloadInfos? infos;
  DownloadTask({
    required this.props,
    required this.mediaPlaylist,
    required this.masterPlaylist,
    required this.queue,
    required this.isCompleted,
    this.infos,
  });

  @HiveField(6)
  bool isCompleted;

  ExtraInfos get extraInfo => ParseHlsPlaylist.getExtraInfos(variant: masterPlaylist.variants.last, media: mediaPlaylist);

  int get total => mediaPlaylist.chunks.length;
  String get id => props.episodeId;

  DownloadTask copyWith({
    MediaPlaylist? mediaPlaylist,
    MasterPlaylist? masterPlaylist,
    List<Chunk>? queue,
    bool? isCompleted,
    DownloadInfos? infos,
    DownloaderProps? props,
  }) => DownloadTask(
    props: props ?? this.props,
    infos: infos ?? this.infos,
    mediaPlaylist: mediaPlaylist ?? this.mediaPlaylist,
    masterPlaylist: masterPlaylist ?? this.masterPlaylist,
    queue: queue ?? this.queue,
    isCompleted: isCompleted ?? this.isCompleted,
  );
}

@HiveType(typeId: 25113)
@JsonSerializable()
class DownloadInfos {
  @HiveField(0)
  final String animeId;
  @HiveField(1)
  final String seasonId;
  @HiveField(2)
  final String episodeId;
  @HiveField(3)
  final DateTime downloadedAt;
  @HiveField(4)
  final int size;
  @HiveField(5)
  final String filePath;
  @HiveField(6)
  final int episodeNumber;
  const DownloadInfos({
    required this.episodeNumber,
    required this.animeId,
    required this.filePath,
    required this.episodeId,
    required this.seasonId,
    required this.downloadedAt,
    required this.size,
  });

  factory DownloadInfos.fromJson(Map<String, dynamic> json) => _$DownloadInfosFromJson(json);
  Map<String, dynamic> toJson() => _$DownloadInfosToJson(this);

  DownloadInfos copyWith({
    String? animeId,
    String? episodeId,
    String? seasonId,
    DateTime? downloadedAt,
    int? size,
    int? episodeNumber,
    String? filePath,
  }) => DownloadInfos(
    filePath: filePath ?? this.filePath,
    episodeNumber: episodeNumber ?? this.episodeNumber,
    animeId: animeId ?? this.animeId,
    episodeId: episodeId ?? this.episodeId,
    seasonId: seasonId ?? this.seasonId,
    downloadedAt: downloadedAt ?? this.downloadedAt,
    size: size ?? this.size,
  );
}

@HiveType(typeId: 7225)
class DownloaderProps {
  @HiveField(0)
  final String animeId;
  @HiveField(1)
  final String seasonId;
  @HiveField(2)
  final String episodeId;
  @HiveField(3)
  final String filePath;
  @HiveField(4)
  final int episodeNumber;
  const DownloaderProps({
    required this.animeId,
    required this.seasonId,
    required this.episodeId,
    required this.filePath,
    required this.episodeNumber,
  });

  factory DownloaderProps.fromEpisode(EpisodeEntity episode) => DownloaderProps(
    animeId: episode.anime.id,
    seasonId: episode.season.id,
    episodeId: episode.id,
    filePath: episode.video,
    episodeNumber: episode.episodeNumber,
  );

  DownloaderProps copyWith({String? animeId, String? seasonId, String? episodeId, String? filePath, int? episodeNumber}) => DownloaderProps(
    episodeNumber: episodeNumber ?? this.episodeNumber,
    animeId: animeId ?? this.animeId,
    seasonId: seasonId ?? this.seasonId,
    episodeId: episodeId ?? this.episodeId,
    filePath: filePath ?? this.filePath,
  );
}
