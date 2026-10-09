// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chapter _$ChapterFromJson(Map<String, dynamic> json) => _Chapter(
  id: json['chapter_id'] as String? ?? "",
  chapterNumber: (json['chapter_number'] as num?)?.toInt() ?? 0,
  releaseDate: json['release_date'] as String? ?? "",
  viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  isRead: json['is_read'] as bool? ?? false,
  isLiked: json['is_liked'] as bool? ?? false,
  isFree: json['is_free'] as bool? ?? false,
);

Map<String, dynamic> _$ChapterToJson(_Chapter instance) => <String, dynamic>{
  'chapter_id': instance.id,
  'chapter_number': instance.chapterNumber,
  'release_date': instance.releaseDate,
  'views_count': instance.viewsCount,
  'likes_count': instance.likesCount,
  'is_read': instance.isRead,
  'is_liked': instance.isLiked,
  'is_free': instance.isFree,
};
