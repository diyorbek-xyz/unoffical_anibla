// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Manga _$MangaFromJson(Map<String, dynamic> json) => _Manga(
  id: json['manga_id'] as String? ?? "",
  title: json['title'] as String? ?? "",
  slug: json['slug'] as String? ?? "",
  thumbnail: json['image_url'] as String? ?? "",
  secondTitle: json['second_title'] as String? ?? "",
  description: json['description'] as String? ?? "",
  ageRestriction: json['age_restriction'] as String? ?? "",
  realLink: json['real_link'] as String? ?? "",
  createdAt: json['created_at'] as String? ?? "",
  updatedAt: json['updated_at'] as String? ?? "",
  showingDate: json['showing_date'] as String? ?? "",
  type:
      $enumDecodeNullable(_$MediaTypeEnumMap, json['type']) ?? MediaType.manga,
  releaseStatus:
      $enumDecodeNullable(_$MangaStatusEnumMap, json['release_status']) ??
      MangaStatus.stopped,
  translationStatus:
      $enumDecodeNullable(_$MangaStatusEnumMap, json['translation_status']) ??
      MangaStatus.stopped,
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
  averageRating: (json['average_rating'] as num?)?.toInt() ?? 0,
  releaseYear: (json['release_year'] as num?)?.toInt() ?? 0,
  chaptersCount: (json['chapters_count'] as num?)?.toInt() ?? 0,
  bookmarkedCount: (json['bookmarked_count'] as num?)?.toInt() ?? 0,
  isBookmarked: json['is_bookmarked'] as bool? ?? false,
  isShowed: json['is_showed'] as bool? ?? false,
  translators:
      (json['translators'] as List<dynamic>?)
          ?.map((e) => ManoTranslator.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => ManoGenre.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => ManoCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  chapters:
      (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MangaToJson(_Manga instance) => <String, dynamic>{
  'manga_id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'image_url': instance.thumbnail,
  'second_title': instance.secondTitle,
  'description': instance.description,
  'age_restriction': instance.ageRestriction,
  'real_link': instance.realLink,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'showing_date': instance.showingDate,
  'type': _$MediaTypeEnumMap[instance.type]!,
  'release_status': _$MangaStatusEnumMap[instance.releaseStatus]!,
  'translation_status': _$MangaStatusEnumMap[instance.translationStatus]!,
  'likes_count': instance.likesCount,
  'views_count': instance.viewsCount,
  'average_rating': instance.averageRating,
  'release_year': instance.releaseYear,
  'chapters_count': instance.chaptersCount,
  'bookmarked_count': instance.bookmarkedCount,
  'is_bookmarked': instance.isBookmarked,
  'is_showed': instance.isShowed,
  'translators': instance.translators,
  'genres': instance.genres,
  'categories': instance.categories,
  'chapters': instance.chapters,
};

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novella',
  MediaType.comics: 'komiks',
};

const _$MangaStatusEnumMap = {
  MangaStatus.continuing: 'continue',
  MangaStatus.stopped: 'stopped',
  MangaStatus.finished: 'finished',
};
