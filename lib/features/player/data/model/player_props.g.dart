// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaStream _$MediaStreamFromJson(Map<String, dynamic> json) => _MediaStream(
  type: $enumDecode(_$MediaTypeEnumMap, json['type']),
  animeTitle: json['animeTitle'] as String,
  episodeTitle: json['episodeTitle'] as String,
  cover: json['cover'] as String,
  url: json['url'] as String,
  episode: (json['episode'] as num?)?.toInt() ?? 0,
  totalEpisodes: (json['totalEpisodes'] as num?)?.toInt() ?? 0,
  startTime: json['startTime'] == null
      ? Duration.zero
      : Duration(microseconds: (json['startTime'] as num).toInt()),
  forCache: json['forCache'] as String?,
  offlineUrl: json['offlineUrl'] as String?,
);

Map<String, dynamic> _$MediaStreamToJson(_MediaStream instance) =>
    <String, dynamic>{
      'type': _$MediaTypeEnumMap[instance.type]!,
      'animeTitle': instance.animeTitle,
      'episodeTitle': instance.episodeTitle,
      'cover': instance.cover,
      'url': instance.url,
      'episode': instance.episode,
      'totalEpisodes': instance.totalEpisodes,
      'startTime': instance.startTime.inMicroseconds,
      'forCache': instance.forCache,
      'offlineUrl': instance.offlineUrl,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novella',
  MediaType.comics: 'komiks',
};
