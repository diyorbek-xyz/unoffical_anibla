// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translated.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslatedAdapter extends TypeAdapter<Translated> {
  @override
  final typeId = 0;

  @override
  Translated read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Translated(rus: fields[1] as String, uz: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, Translated obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.uz)
      ..writeByte(1)
      ..write(obj.rus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslatedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
