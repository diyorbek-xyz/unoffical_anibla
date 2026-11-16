// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaProps _$MediaPropsFromJson(Map<String, dynamic> json) => _MediaProps(
  type: MediaType.fromJson(json['type'] as String),
  mediaKey: json['mediaKey'] as String,
  seasonKey: json['seasonKey'] as String?,
  chapterKey: json['chapterKey'] as String?,
);

Map<String, dynamic> _$MediaPropsToJson(_MediaProps instance) =>
    <String, dynamic>{
      'type': _$MediaTypeEnumMap[instance.type]!,
      'mediaKey': instance.mediaKey,
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
