import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/common/data/models/helpers/translated.dart';
import 'package:application/features/common/mapper/translated_mapper.dart';
import 'package:application/features/player/data/model/parser_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'completed_models.g.dart';
part 'completed_models.freezed.dart';

@HiveType(typeId: 25113)
@Freezed(fromJson: true, toJson: true)
sealed class DownloadInfos with _$DownloadInfos {
  factory DownloadInfos({
    @HiveField(0) required final String streamUrl,
    @HiveField(1) required final String downloadUrl,
    @HiveField(2) required final String localFolderUrl,
    @HiveField(3) final DateTime? downloadedAt,
    @HiveField(4) required final int size,
    @HiveField(5) required final String animeId,
    @HiveField(6) required final TranslatedModel animeTitle,
    @HiveField(7) required final String seasonId,
    @HiveField(8) required final TranslatedModel seasonTitle,
    @HiveField(9) required final String episodeId,
    @HiveField(10) required final TranslatedModel episodeTitle,
    @HiveField(11) required final int episodeNumber,
    @JsonKey(includeFromJson: false, includeToJson: false) final MasterPlaylist? masterPlaylist,
    @JsonKey(includeFromJson: false, includeToJson: false) final Variant? variant,
  }) = _DownloadInfos;

  factory DownloadInfos.fromJson(Map<String, dynamic> json) => _$DownloadInfosFromJson(json);
  factory DownloadInfos.fromEpisode(EpisodeEntity episode, {MasterPlaylist? master, Variant? variant}) => DownloadInfos(
    variant: variant,
    masterPlaylist: master,
    size: 0,
    downloadUrl: "",
    localFolderUrl: "${episode.anime.id}/${episode.season.id}/${episode.id}",
    streamUrl: episode.video,
    animeId: episode.anime.id,
    animeTitle: TranslatedMapper.entityToModel(episode.anime.title),
    seasonId: episode.season.id,
    seasonTitle: TranslatedMapper.entityToModel(episode.season.title),
    episodeId: episode.id,
    episodeTitle: TranslatedMapper.entityToModel(episode.title),
    episodeNumber: episode.episodeNumber,
  );
}
