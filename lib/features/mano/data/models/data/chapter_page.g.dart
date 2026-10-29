// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_page.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterPageAdapter extends TypeAdapter<ChapterPage> {
  @override
  final typeId = 8689;

  @override
  ChapterPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterPage(
      id: fields[0] == null ? '' : fields[0] as String,
      imageUrl: fields[1] == null ? '' : fields[1] as String,
      chapterId: fields[2] == null ? '' : fields[2] as String,
      pageNumber: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      width: fields[4] == null ? 0 : (fields[4] as num).toInt(),
      height: fields[5] == null ? 0 : (fields[5] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ChapterPage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.chapterId)
      ..writeByte(3)
      ..write(obj.pageNumber)
      ..writeByte(4)
      ..write(obj.width)
      ..writeByte(5)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterPage _$ChapterPageFromJson(Map<String, dynamic> json) => _ChapterPage(
  id: json['page_id'] as String? ?? "",
  imageUrl: json['image_url'] as String? ?? "",
  chapterId: json['chapter_id'] as String? ?? "",
  pageNumber: (json['page_number'] as num?)?.toInt() ?? 0,
  width: (json['width'] as num?)?.toInt() ?? 0,
  height: (json['height'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChapterPageToJson(_ChapterPage instance) =>
    <String, dynamic>{
      'page_id': instance.id,
      'image_url': instance.imageUrl,
      'chapter_id': instance.chapterId,
      'page_number': instance.pageNumber,
      'width': instance.width,
      'height': instance.height,
    };
