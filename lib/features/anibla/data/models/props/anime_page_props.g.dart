// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_page_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimePageProps _$AnimePagePropsFromJson(Map<String, dynamic> json) =>
    _AnimePageProps(
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['type']),
      animeSlug: json['anime'] as String,
      seasonSlug: json['season'] as String?,
      episodeSlug: json['episode'] as String?,
      localPath: json['video'] as String?,
    );

Map<String, dynamic> _$AnimePagePropsToJson(_AnimePageProps instance) =>
    <String, dynamic>{
      'type': _$MediaTypeEnumMap[instance.mediaType]!,
      'anime': instance.animeSlug,
      'season': instance.seasonSlug,
      'episode': instance.episodeSlug,
      'video': instance.localPath,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};
