import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/data/mapper/season_mapper.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/data/models/episode_model.dart';
import 'package:application/features/animes/data/models/season_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/domain/entities/season_entity.dart';
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
    @HiveField(4) required final AnimeModel animeModel,
    @HiveField(5) required final SeasonModel seasonModel,
    @HiveField(6) required final EpisodeModel episodeModel,
    @HiveField(7) @Default("") String localPath,
    @JsonKey(includeFromJson: false, includeToJson: false) final MasterPlaylist? masterPlaylist,
    @JsonKey(includeFromJson: false, includeToJson: false) final Variant? variant,
  }) = _DownloadInfos;

  @HiveField(8)
  String get streamUrl => episode.video;

  @HiveField(9)
  String get localFolderUrl => "${anime.id}/${season.id}/${episode.id}";

  AnimeEntity get anime => AnimeMapper.modelToEntity(animeModel);
  SeasonEntity get season => SeasonMapper.modelToEntity(seasonModel);
  EpisodeEntity get episode => EpisodeMapper.modelToEntity(episodeModel);

  factory DownloadInfos.fromJson(Map<String, dynamic> json) => _$DownloadInfosFromJson(json);
}
