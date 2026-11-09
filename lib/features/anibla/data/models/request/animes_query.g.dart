// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animes_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimesQuery _$AnimesQueryFromJson(Map<String, dynamic> json) => _AnimesQuery(
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  search: json['search'] as String?,
  type:
      $enumDecodeNullable(_$AnimesQueryTypeEnumMap, json['type']) ??
      AnimesQueryType.media,
  genres: _$JsonConverterFromJson<String, List<String>>(
    json['genres'],
    const CommaConverter().fromJson,
  ),
  categories: _$JsonConverterFromJson<String, List<String>>(
    json['categories'],
    const CommaConverter().fromJson,
  ),
);

Map<String, dynamic> _$AnimesQueryToJson(_AnimesQuery instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'search': instance.search,
      'type': _$AnimesQueryTypeEnumMap[instance.type]!,
      'genres': _$JsonConverterToJson<String, List<String>>(
        instance.genres,
        const CommaConverter().toJson,
      ),
      'categories': _$JsonConverterToJson<String, List<String>>(
        instance.categories,
        const CommaConverter().toJson,
      ),
    };

const _$AnimesQueryTypeEnumMap = {
  AnimesQueryType.series: 'series',
  AnimesQueryType.movies: 'movies',
  AnimesQueryType.media: 'media',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
