// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterResponse<T> _$ChapterResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ChapterResponse<T>(
  chapters: fromJsonT(json['chapters']),
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  offset: (json['offset'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChapterResponseToJson<T>(
  _ChapterResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'chapters': toJsonT(instance.chapters),
  'limit': instance.limit,
  'offset': instance.offset,
  'total': instance.total,
};
