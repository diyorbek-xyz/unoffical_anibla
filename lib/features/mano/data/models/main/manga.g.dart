// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaAdapter extends TypeAdapter<Manga> {
  @override
  final typeId = 6234;

  @override
  Manga read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Manga(
      slug: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
      description: fields[2] == null ? '' : fields[2] as String,
      genres: fields[3] == null ? [] : (fields[3] as List).cast<ManoGenre>(),
      chapters: fields[4] == null
          ? []
          : (fields[4] as List).cast<ManoChapter>(),
      type: fields[5] == null ? MediaType.manga : fields[5] as MediaType,
      categories: fields[6] == null
          ? []
          : (fields[6] as List).cast<ManoCategory>(),
      translators: fields[7] == null
          ? []
          : (fields[7] as List).cast<ManoTranslator>(),
      id: fields[8] == null ? '' : fields[8] as String,
      realLink: fields[9] == null ? '' : fields[9] as String,
      likesCount: fields[10] == null ? 0 : (fields[10] as num).toInt(),
      viewsCount: fields[11] == null ? 0 : (fields[11] as num).toInt(),
      thumbnail: fields[12] == null ? '' : fields[12] as String,
      isShowed: fields[13] == null ? false : fields[13] as bool,
      updatedAt: fields[14] == null ? '' : fields[14] as String,
      createdAt: fields[15] == null ? '' : fields[15] as String,
      releaseYear: fields[16] == null ? 0 : (fields[16] as num).toInt(),
      secondTitle: fields[17] == null ? '' : fields[17] as String,
      showingDate: fields[18] == null ? '' : fields[18] as String,
      averageRating: fields[19] == null ? 0 : (fields[19] as num).toInt(),
      chaptersCount: fields[20] == null ? 0 : (fields[20] as num).toInt(),
      isBookmarked: fields[21] == null ? false : fields[21] as bool,
      bookmarkedCount: fields[22] == null ? 0 : (fields[22] as num).toInt(),
      ageRestriction: fields[23] == null ? '' : fields[23] as String,
      releaseStatus: fields[24] == null
          ? BookStatus.stopped
          : fields[24] as BookStatus,
      translationStatus: fields[25] == null
          ? BookStatus.stopped
          : fields[25] as BookStatus,
    );
  }

  @override
  void write(BinaryWriter writer, Manga obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.slug)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.chapters)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.translators)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.realLink)
      ..writeByte(10)
      ..write(obj.likesCount)
      ..writeByte(11)
      ..write(obj.viewsCount)
      ..writeByte(12)
      ..write(obj.thumbnail)
      ..writeByte(13)
      ..write(obj.isShowed)
      ..writeByte(14)
      ..write(obj.updatedAt)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.releaseYear)
      ..writeByte(17)
      ..write(obj.secondTitle)
      ..writeByte(18)
      ..write(obj.showingDate)
      ..writeByte(19)
      ..write(obj.averageRating)
      ..writeByte(20)
      ..write(obj.chaptersCount)
      ..writeByte(21)
      ..write(obj.isBookmarked)
      ..writeByte(22)
      ..write(obj.bookmarkedCount)
      ..writeByte(23)
      ..write(obj.ageRestriction)
      ..writeByte(24)
      ..write(obj.releaseStatus)
      ..writeByte(25)
      ..write(obj.translationStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Manga _$MangaFromJson(Map<String, dynamic> json) => _Manga(
  slug: json['slug'] as String? ?? "",
  title: json['title'] as String? ?? "",
  description: json['description'] as String? ?? "",
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => ManoGenre.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  chapters:
      (json['chapters'] as List<dynamic>?)
          ?.map((e) => ManoChapter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  type:
      $enumDecodeNullable(_$MediaTypeEnumMap, json['type']) ?? MediaType.manga,
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => ManoCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  translators:
      (json['translators'] as List<dynamic>?)
          ?.map((e) => ManoTranslator.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  id: json['manga_id'] as String? ?? "",
  realLink: json['real_link'] as String? ?? "",
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
  thumbnail: json['image_url'] as String? ?? "",
  isShowed: json['is_showed'] as bool? ?? false,
  updatedAt: json['updated_at'] as String? ?? "",
  createdAt: json['created_at'] as String? ?? "",
  releaseYear: (json['release_year'] as num?)?.toInt() ?? 0,
  secondTitle: json['second_title'] as String? ?? "",
  showingDate: json['showing_date'] as String? ?? "",
  averageRating: (json['average_rating'] as num?)?.toInt() ?? 0,
  chaptersCount: (json['chapters_count'] as num?)?.toInt() ?? 0,
  isBookmarked: json['is_bookmarked'] as bool? ?? false,
  bookmarkedCount: (json['bookmarked_count'] as num?)?.toInt() ?? 0,
  ageRestriction: json['age_restriction'] as String? ?? "",
  releaseStatus:
      $enumDecodeNullable(_$BookStatusEnumMap, json['release_status']) ??
      BookStatus.stopped,
  translationStatus:
      $enumDecodeNullable(_$BookStatusEnumMap, json['translation_status']) ??
      BookStatus.stopped,
);

Map<String, dynamic> _$MangaToJson(_Manga instance) => <String, dynamic>{
  'slug': instance.slug,
  'title': instance.title,
  'description': instance.description,
  'genres': instance.genres,
  'chapters': instance.chapters,
  'type': _$MediaTypeEnumMap[instance.type]!,
  'categories': instance.categories,
  'translators': instance.translators,
  'manga_id': instance.id,
  'real_link': instance.realLink,
  'likes_count': instance.likesCount,
  'views_count': instance.viewsCount,
  'image_url': instance.thumbnail,
  'is_showed': instance.isShowed,
  'updated_at': instance.updatedAt,
  'created_at': instance.createdAt,
  'release_year': instance.releaseYear,
  'second_title': instance.secondTitle,
  'showing_date': instance.showingDate,
  'average_rating': instance.averageRating,
  'chapters_count': instance.chaptersCount,
  'is_bookmarked': instance.isBookmarked,
  'bookmarked_count': instance.bookmarkedCount,
  'age_restriction': instance.ageRestriction,
  'release_status': _$BookStatusEnumMap[instance.releaseStatus]!,
  'translation_status': _$BookStatusEnumMap[instance.translationStatus]!,
};

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};

const _$BookStatusEnumMap = {
  BookStatus.continuing: 'continue',
  BookStatus.stopped: 'stopped',
  BookStatus.finished: 'finished',
};
