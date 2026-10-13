// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MangaRequest _$MangaRequestFromJson(Map<String, dynamic> json) =>
    _MangaRequest(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      type: $enumDecodeNullable(_$MediaTypeEnumMap, json['types']),
      search: json['search'] as String?,
      sortBy: $enumDecodeNullable(_$SortTypeEnumMap, json['sort_by']),
      releaseStatus: json['release_statuses'] as String?,
      ageRestrictions: json['age_restrictions'] as String?,
      translationStatus: json['translation_statuses'] as String?,
      genreIds: _$JsonConverterFromJson<String, List<String>>(
        json['genre_ids'],
        const ListConverter().fromJson,
      ),
      categoryIds: _$JsonConverterFromJson<String, List<String>>(
        json['category_ids'],
        const ListConverter().fromJson,
      ),
    );

Map<String, dynamic> _$MangaRequestToJson(_MangaRequest instance) =>
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
        const ListConverter().toJson,
      ),
      'category_ids': _$JsonConverterToJson<String, List<String>>(
        instance.categoryIds,
        const ListConverter().toJson,
      ),
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};

const _$SortTypeEnumMap = {
  SortType.latestChapter: 'latest_chapter',
  SortType.newest: 'newest',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
