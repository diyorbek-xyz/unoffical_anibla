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
    return TranslatedModel(ru: fields[1] as String?, uz: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, TranslatedModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.uz)
      ..writeByte(1)
      ..write(obj.ru);
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

TranslatedModel _$TranslatedModelFromJson(Map<String, dynamic> json) =>
    TranslatedModel(ru: json['ru'] as String?, uz: json['uz'] as String?);

Map<String, dynamic> _$TranslatedModelToJson(TranslatedModel instance) =>
    <String, dynamic>{'uz': instance.uz, 'ru': instance.ru};
