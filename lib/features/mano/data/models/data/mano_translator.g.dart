// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_translator.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManoTranslatorAdapter extends TypeAdapter<ManoTranslator> {
  @override
  final typeId = 6223;

  @override
  ManoTranslator read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManoTranslator(
      id: fields[0] == null ? '' : fields[0] as String,
      mangaId: fields[1] == null ? '' : fields[1] as String,
      firstName: fields[2] == null ? '' : fields[2] as String,
      picture: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ManoTranslator obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mangaId)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.picture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManoTranslatorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoTranslator _$ManoTranslatorFromJson(Map<String, dynamic> json) =>
    _ManoTranslator(
      id: json['translator_id'] as String? ?? "",
      mangaId: json['manga_id'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      picture: json['picture_link'] as String? ?? "",
    );

Map<String, dynamic> _$ManoTranslatorToJson(_ManoTranslator instance) =>
    <String, dynamic>{
      'translator_id': instance.id,
      'manga_id': instance.mangaId,
      'first_name': instance.firstName,
      'picture_link': instance.picture,
    };
