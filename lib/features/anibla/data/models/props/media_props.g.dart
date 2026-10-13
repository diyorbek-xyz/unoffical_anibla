// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaProps _$MediaPropsFromJson(Map<String, dynamic> json) => _MediaProps(
  mediaKey: json['mediaKey'] as String,
  type: $enumDecode(_$MediaTypeEnumMap, json['type']),
  seasonKey: json['seasonKey'] as String?,
  chapterKey: json['chapterKey'] as String?,
);

Map<String, dynamic> _$MediaPropsToJson(_MediaProps instance) =>
    <String, dynamic>{
      'mediaKey': instance.mediaKey,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'seasonKey': instance.seasonKey,
      'chapterKey': instance.chapterKey,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};
