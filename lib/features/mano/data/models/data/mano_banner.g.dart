// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_banner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManoBannerAdapter extends TypeAdapter<ManoBanner> {
  @override
  final typeId = 9566;

  @override
  ManoBanner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManoBanner(
      id: fields[0] == null ? '' : fields[0] as String,
      description: fields[1] == null ? '' : fields[1] as String,
      imageLink: fields[2] == null ? '' : fields[2] as String,
      type: fields[3] == null ? MediaType.manga : fields[3] as MediaType,
    );
  }

  @override
  void write(BinaryWriter writer, ManoBanner obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.imageLink)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManoBannerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoCategory _$ManoCategoryFromJson(Map<String, dynamic> json) =>
    _ManoCategory(
      id: json['id'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageLink: json['image_link'] as String? ?? "",
      type:
          $enumDecodeNullable(_$MediaTypeEnumMap, json['content_type']) ??
          MediaType.manga,
    );

Map<String, dynamic> _$ManoCategoryToJson(_ManoCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image_link': instance.imageLink,
      'content_type': _$MediaTypeEnumMap[instance.type]!,
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'Movies',
  MediaType.serie: 'Series',
  MediaType.manga: 'manga',
  MediaType.manxva: 'manhwa',
  MediaType.novel: 'novel',
  MediaType.comics: 'comics',
};
