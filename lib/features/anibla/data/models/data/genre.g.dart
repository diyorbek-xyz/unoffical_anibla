// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final typeId = 6;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? const Localized() : fields[1] as Localized,
      slug: fields[2] == null ? '' : fields[2] as String,
      status: fields[3] == null ? false : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Genre _$GenreFromJson(Map<String, dynamic> json) => _Genre(
  id: json['_id'] as String? ?? "",
  title: json['name'] == null
      ? const Localized()
      : Localized.fromJson(json['name'] as Map<String, dynamic>),
  slug: json['slug'] as String? ?? "",
  status: json['status'] as bool? ?? false,
);

Map<String, dynamic> _$GenreToJson(_Genre instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.title,
  'slug': instance.slug,
  'status': instance.status,
};
