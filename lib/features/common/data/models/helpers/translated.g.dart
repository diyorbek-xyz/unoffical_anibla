// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translated.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslatedModelAdapter extends TypeAdapter<TranslatedModel> {
  @override
  final typeId = 5;

  @override
  TranslatedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranslatedModel(ru: fields[0] as String?, uz: fields[1] as String?);
  }

  @override
  void write(BinaryWriter writer, TranslatedModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ru)
      ..writeByte(1)
      ..write(obj.uz);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslatedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslatedModel _$TranslatedModelFromJson(Map<String, dynamic> json) =>
    _TranslatedModel(ru: json['ru'] as String?, uz: json['uz'] as String?);

Map<String, dynamic> _$TranslatedModelToJson(_TranslatedModel instance) =>
    <String, dynamic>{'ru': instance.ru, 'uz': instance.uz};
