// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BooksQuery _$BooksQueryFromJson(Map<String, dynamic> json) => _BooksQuery(
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
  type: json['types'] == null
      ? null
      : MediaType.fromJson(json['types'] as String),
  search: json['search'] as String?,
  sortBy: $enumDecodeNullable(_$SortTypeEnumMap, json['sort_by']),
  releaseStatus: json['release_statuses'] as String?,
  ageRestrictions: json['age_restrictions'] as String?,
  translationStatus: json['translation_statuses'] as String?,
  genreIds: _$JsonConverterFromJson<String, List<String>>(
    json['genre_ids'],
    const CommaConverter().fromJson,
  ),
  categoryIds: _$JsonConverterFromJson<String, List<String>>(
    json['category_ids'],
    const CommaConverter().fromJson,
  ),
  queryType: $enumDecodeNullable(_$BooksQueryTypeEnumMap, json['queryType']),
);

Map<String, dynamic> _$BooksQueryToJson(_BooksQuery instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'types': _$MediaTypeEnumMap[instance.type],
      'search': instance.search,
      'sort_by': _$SortTypeEnumMap[instance.sortBy],
      'release_statuses': instance.releaseStatus,
      'age_restrictions': instance.ageRestrictions,
      'translation_statuses': instance.translationStatus,
      'genre_ids': _$JsonConverterToJson<String, List<String>>(
        instance.genreIds,
        const CommaConverter().toJson,
      ),
      'category_ids': _$JsonConverterToJson<String, List<String>>(
        instance.categoryIds,
        const CommaConverter().toJson,
      ),
      'queryType': _$BooksQueryTypeEnumMap[instance.queryType],
    };

const _$SortTypeEnumMap = {
  SortType.latestChapter: 'latest_chapter',
  SortType.newest: 'newest',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$BooksQueryTypeEnumMap = {
  BooksQueryType.manga: 'manga',
  BooksQueryType.novels: 'novels',
};

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
