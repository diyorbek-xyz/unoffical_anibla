// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimePageProps _$AnimePagePropsFromJson(Map<String, dynamic> json) =>
    _AnimePageProps(
      animeType: $enumDecode(_$AnimeTypeEnumMap, json['type']),
      animeSlug: json['anime'] as String,
      seasonSlug: json['season'] as String?,
      episodeSlug: json['episode'] as String?,
    );

Map<String, dynamic> _$AnimePagePropsToJson(_AnimePageProps instance) =>
    <String, dynamic>{
      'type': _$AnimeTypeEnumMap[instance.animeType]!,
      'anime': instance.animeSlug,
      'season': instance.seasonSlug,
      'episode': instance.episodeSlug,
    };

const _$AnimeTypeEnumMap = {
  AnimeType.movie: 'Movies',
  AnimeType.serie: 'Series',
};
