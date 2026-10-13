// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_genre.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManoGenreAdapter extends TypeAdapter<ManoGenre> {
  @override
  final typeId = 7345;

  @override
  ManoGenre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManoGenre(
      id: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ManoGenre obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManoGenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoGenre _$ManoGenreFromJson(Map<String, dynamic> json) => _ManoGenre(
  id: json['genre_id'] as String? ?? "",
  title: json['name'] as String? ?? "",
);

Map<String, dynamic> _$ManoGenreToJson(_ManoGenre instance) =>
    <String, dynamic>{'genre_id': instance.id, 'name': instance.title};
