import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:application/features/player/data/model/parser_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'completed_models.g.dart';
part 'completed_models.freezed.dart';

@HiveType(typeId: 25113)
@Freezed(fromJson: true, toJson: true)
abstract class DownloadInfos with _$DownloadInfos {
  const DownloadInfos._();
  factory DownloadInfos({
    @HiveField(0) final DateTime? downloadedAt,
    @HiveField(1) required final int size,
    @HiveField(2) required final String downloadUrl,
    @HiveField(4) required final Anime anime,
    @HiveField(5) required final Season season,
    @HiveField(6) required final Episode episode,
    @HiveField(7) @Default("") String localPath,
    @JsonKey(includeFromJson: false, includeToJson: false) final MasterPlaylist? masterPlaylist,
    @JsonKey(includeFromJson: false, includeToJson: false) final Variant? variant,
  }) = _DownloadInfos;

  @HiveField(8)
  String get streamUrl => episode.video;

  @HiveField(9)
  String get localFolderUrl => "${anime.id}/${season.id}/${episode.id}";

  factory DownloadInfos.fromJson(Map<String, dynamic> json) => _$DownloadInfosFromJson(json);
}
