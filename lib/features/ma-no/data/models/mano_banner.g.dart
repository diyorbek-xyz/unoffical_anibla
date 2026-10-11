// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoCategory _$ManoCategoryFromJson(Map<String, dynamic> json) =>
    _ManoCategory(
      id: json['id'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageLink: json['image_link'] as String? ?? "",
      type:
          $enumDecodeNullable(_$MediaTypeEnumMap, json['content_type']) ??
          MediaType.manga,
    );

Map<String, dynamic> _$ManoCategoryToJson(_ManoCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image_link': instance.imageLink,
      'content_type': _$MediaTypeEnumMap[instance.type]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novella',
  MediaType.comics: 'komiks',
};
