// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NovelAdapter extends TypeAdapter<Novel> {
  @override
  final typeId = 6236;

  @override
  Novel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Novel(
      slug: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
      description: fields[2] == null ? '' : fields[2] as String,
      genres: fields[3] == null ? [] : (fields[3] as List).cast<ManoGenre>(),
      chapters: fields[4] == null
          ? []
          : (fields[4] as List).cast<ManoChapter>(),
      categories: fields[5] == null
          ? []
          : (fields[5] as List).cast<ManoCategory>(),
      translators: fields[6] == null
          ? []
          : (fields[6] as List).cast<ManoTranslator>(),
      likesCount: fields[7] == null ? 0 : (fields[7] as num).toInt(),
      viewsCount: fields[8] == null ? 0 : (fields[8] as num).toInt(),
      releaseYear: fields[9] == null ? 0 : (fields[9] as num).toInt(),
      averageRating: fields[10] == null ? 0 : (fields[10] as num).toInt(),
      chaptersCount: fields[11] == null ? 0 : (fields[11] as num).toInt(),
      bookmarkedCount: fields[12] == null ? 0 : (fields[12] as num).toInt(),
      isShowed: fields[13] == null ? false : fields[13] as bool,
      isBookmarked: fields[14] == null ? false : fields[14] as bool,
      isCommentEnabled: fields[15] == null ? false : fields[15] as bool,
      id: fields[16] == null ? '' : fields[16] as String,
      realLink: fields[17] == null ? '' : fields[17] as String,
      thumbnail: fields[18] == null ? '' : fields[18] as String,
      updatedAt: fields[19] == null ? '' : fields[19] as String,
      createdAt: fields[20] == null ? '' : fields[20] as String,
      secondTitle: fields[21] == null ? '' : fields[21] as String,
      showingDate: fields[22] == null ? '' : fields[22] as String,
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
  void write(BinaryWriter writer, Novel obj) {
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
      ..write(obj.categories)
      ..writeByte(6)
      ..write(obj.translators)
      ..writeByte(7)
      ..write(obj.likesCount)
      ..writeByte(8)
      ..write(obj.viewsCount)
      ..writeByte(9)
      ..write(obj.releaseYear)
      ..writeByte(10)
      ..write(obj.averageRating)
      ..writeByte(11)
      ..write(obj.chaptersCount)
      ..writeByte(12)
      ..write(obj.bookmarkedCount)
      ..writeByte(13)
      ..write(obj.isShowed)
      ..writeByte(14)
      ..write(obj.isBookmarked)
      ..writeByte(15)
      ..write(obj.isCommentEnabled)
      ..writeByte(16)
      ..write(obj.id)
      ..writeByte(17)
      ..write(obj.realLink)
      ..writeByte(18)
      ..write(obj.thumbnail)
      ..writeByte(19)
      ..write(obj.updatedAt)
      ..writeByte(20)
      ..write(obj.createdAt)
      ..writeByte(21)
      ..write(obj.secondTitle)
      ..writeByte(22)
      ..write(obj.showingDate)
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
      other is NovelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Novel _$NovelFromJson(Map<String, dynamic> json) => _Novel(
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
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
  releaseYear: (json['release_year'] as num?)?.toInt() ?? 0,
  averageRating: (json['average_rating'] as num?)?.toInt() ?? 0,
  chaptersCount: (json['chapters_count'] as num?)?.toInt() ?? 0,
  bookmarkedCount: (json['bookmarked_count'] as num?)?.toInt() ?? 0,
  isShowed: json['is_showed'] as bool? ?? false,
  isBookmarked: json['is_bookmarked'] as bool? ?? false,
  isCommentEnabled: json['is_comment_enabled'] as bool? ?? false,
  id: json['novel_id'] as String? ?? "",
  realLink: json['real_link'] as String? ?? "",
  thumbnail: json['image_url'] as String? ?? "",
  updatedAt: json['updated_at'] as String? ?? "",
  createdAt: json['created_at'] as String? ?? "",
  secondTitle: json['second_title'] as String? ?? "",
  showingDate: json['showing_date'] as String? ?? "",
  ageRestriction: json['age_restriction'] as String? ?? "",
  releaseStatus:
      $enumDecodeNullable(_$BookStatusEnumMap, json['release_status']) ??
      BookStatus.stopped,
  translationStatus:
      $enumDecodeNullable(_$BookStatusEnumMap, json['translation_status']) ??
      BookStatus.stopped,
);

Map<String, dynamic> _$NovelToJson(_Novel instance) => <String, dynamic>{
  'slug': instance.slug,
  'title': instance.title,
  'description': instance.description,
  'genres': instance.genres,
  'chapters': instance.chapters,
  'categories': instance.categories,
  'translators': instance.translators,
  'likes_count': instance.likesCount,
  'views_count': instance.viewsCount,
  'release_year': instance.releaseYear,
  'average_rating': instance.averageRating,
  'chapters_count': instance.chaptersCount,
  'bookmarked_count': instance.bookmarkedCount,
  'is_showed': instance.isShowed,
  'is_bookmarked': instance.isBookmarked,
  'is_comment_enabled': instance.isCommentEnabled,
  'novel_id': instance.id,
  'real_link': instance.realLink,
  'image_url': instance.thumbnail,
  'updated_at': instance.updatedAt,
  'created_at': instance.createdAt,
  'second_title': instance.secondTitle,
  'showing_date': instance.showingDate,
  'age_restriction': instance.ageRestriction,
  'release_status': _$BookStatusEnumMap[instance.releaseStatus]!,
  'translation_status': _$BookStatusEnumMap[instance.translationStatus]!,
};

const _$BookStatusEnumMap = {
  BookStatus.continuing: 'continue',
  BookStatus.stopped: 'stopped',
  BookStatus.finished: 'finished',
};
