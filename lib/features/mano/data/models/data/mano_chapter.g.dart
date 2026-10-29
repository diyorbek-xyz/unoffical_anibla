// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_chapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManoChapterAdapter extends TypeAdapter<ManoChapter> {
  @override
  final typeId = 8634;

  @override
  ManoChapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManoChapter(
      id: fields[0] == null ? '' : fields[0] as String,
      chapterNumber: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      releaseDate: fields[2] == null ? '' : fields[2] as String,
      viewsCount: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      likesCount: fields[4] == null ? 0 : (fields[4] as num).toInt(),
      isRead: fields[5] == null ? false : fields[5] as bool,
      isLiked: fields[6] == null ? false : fields[6] as bool,
      isFree: fields[7] == null ? false : fields[7] as bool,
      pages: fields[8] == null ? [] : (fields[8] as List).cast<ChapterPage>(),
      title: fields[9] == null ? '' : fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ManoChapter obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chapterNumber)
      ..writeByte(2)
      ..write(obj.releaseDate)
      ..writeByte(3)
      ..write(obj.viewsCount)
      ..writeByte(4)
      ..write(obj.likesCount)
      ..writeByte(5)
      ..write(obj.isRead)
      ..writeByte(6)
      ..write(obj.isLiked)
      ..writeByte(7)
      ..write(obj.isFree)
      ..writeByte(8)
      ..write(obj.pages)
      ..writeByte(9)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManoChapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoChapter _$ManoChapterFromJson(Map<String, dynamic> json) => _ManoChapter(
  id: json['chapter_id'] as String? ?? "",
  chapterNumber: (json['chapter_number'] as num?)?.toInt() ?? 0,
  releaseDate: json['release_date'] as String? ?? "",
  viewsCount: (json['views_count'] as num?)?.toInt() ?? 0,
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  isRead: json['is_read'] as bool? ?? false,
  isLiked: json['is_liked'] as bool? ?? false,
  isFree: json['is_free'] as bool? ?? false,
  pages:
      (json['pages'] as List<dynamic>?)
          ?.map((e) => ChapterPage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  title: json['title'] as String? ?? "",
);

Map<String, dynamic> _$ManoChapterToJson(_ManoChapter instance) =>
    <String, dynamic>{
      'chapter_id': instance.id,
      'chapter_number': instance.chapterNumber,
      'release_date': instance.releaseDate,
      'views_count': instance.viewsCount,
      'likes_count': instance.likesCount,
      'is_read': instance.isRead,
      'is_liked': instance.isLiked,
      'is_free': instance.isFree,
      'pages': instance.pages,
      'title': instance.title,
    };
