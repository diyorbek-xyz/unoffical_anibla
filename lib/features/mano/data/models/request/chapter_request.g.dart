// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterRequest _$ChapterRequestFromJson(Map<String, dynamic> json) =>
    _ChapterRequest(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10000,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      search: json['search'] as String? ?? "",
      order:
          $enumDecodeNullable(_$OrderDirectionEnumMap, json['order_dir']) ??
          OrderDirection.ascending,
    );

Map<String, dynamic> _$ChapterRequestToJson(_ChapterRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'offset': instance.offset,
      'search': instance.search,
      'order_dir': _$OrderDirectionEnumMap[instance.order]!,
    };

const _$OrderDirectionEnumMap = {
  OrderDirection.descending: 'desc',
  OrderDirection.ascending: 'asc',
};
