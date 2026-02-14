// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'miscs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationModelAdapter extends TypeAdapter<PaginationModel> {
  @override
  final typeId = 0;

  @override
  PaginationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaginationModel(
      total: (fields[0] as num).toInt(),
      limit: (fields[1] as num).toInt(),
      page: (fields[2] as num).toInt(),
      pages: (fields[3] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, PaginationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.limit)
      ..writeByte(2)
      ..write(obj.page)
      ..writeByte(3)
      ..write(obj.pages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideoModelAdapter extends TypeAdapter<VideoModel> {
  @override
  final typeId = 1;

  @override
  VideoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoModel(
      file: fields[0] as String,
      introStart: (fields[1] as num).toInt(),
      introEnd: (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, VideoModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.file)
      ..writeByte(1)
      ..write(obj.introStart)
      ..writeByte(2)
      ..write(obj.introEnd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TranslatedModelAdapter extends TypeAdapter<TranslatedModel> {
  @override
  final typeId = 2;

  @override
  TranslatedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranslatedModel(ru: fields[1] as String, uz: fields[0] as String);
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
