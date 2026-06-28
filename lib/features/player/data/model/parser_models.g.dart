// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MasterPlaylistAdapter extends TypeAdapter<MasterPlaylist> {
  @override
  final typeId = 544;

  @override
  MasterPlaylist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MasterPlaylist(
      variants: (fields[0] as List).cast<Variant>(),
      version: (fields[1] as num).toInt(),
      downloadUrl: fields[2] as String,
      localUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MasterPlaylist obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.variants)
      ..writeByte(1)
      ..write(obj.version)
      ..writeByte(2)
      ..write(obj.downloadUrl)
      ..writeByte(3)
      ..write(obj.localUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasterPlaylistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MediaPlaylistAdapter extends TypeAdapter<MediaPlaylist> {
  @override
  final typeId = 3725;

  @override
  MediaPlaylist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaPlaylist(
      chunks: (fields[0] as List).cast<Chunk>(),
      downloadUrl: fields[1] as String,
      localUrl: fields[2] as String,
      targetDuration: (fields[3] as num).toDouble(),
      type: fields[4] as String,
      version: (fields[5] as num).toInt(),
      startIndex: (fields[6] as num).toInt(),
      bandwidth: (fields[7] as num).toInt(),
      height: (fields[8] as num).toInt(),
      width: (fields[9] as num).toInt(),
      codecs: fields[10] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MediaPlaylist obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.chunks)
      ..writeByte(1)
      ..write(obj.downloadUrl)
      ..writeByte(2)
      ..write(obj.localUrl)
      ..writeByte(3)
      ..write(obj.targetDuration)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.version)
      ..writeByte(6)
      ..write(obj.startIndex)
      ..writeByte(7)
      ..write(obj.bandwidth)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.width)
      ..writeByte(10)
      ..write(obj.codecs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaPlaylistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChunkAdapter extends TypeAdapter<Chunk> {
  @override
  final typeId = 763;

  @override
  Chunk read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chunk(
      downloadUrl: fields[0] as String,
      duration: (fields[1] as num).toDouble(),
      localUrl: fields[2] as String,
      relativeUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Chunk obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.downloadUrl)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.localUrl)
      ..writeByte(3)
      ..write(obj.relativeUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChunkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantAdapter extends TypeAdapter<Variant> {
  @override
  final typeId = 3513;

  @override
  Variant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Variant(
      bandwidth: (fields[0] as num).toInt(),
      codecs: fields[1] as String,
      height: (fields[2] as num).toInt(),
      width: (fields[3] as num).toInt(),
      localUrl: fields[4] as String,
      downloadUrl: fields[5] as String,
      relativeUrl: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Variant obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.bandwidth)
      ..writeByte(1)
      ..write(obj.codecs)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.width)
      ..writeByte(4)
      ..write(obj.localUrl)
      ..writeByte(5)
      ..write(obj.downloadUrl)
      ..writeByte(6)
      ..write(obj.relativeUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExtraInfosAdapter extends TypeAdapter<ExtraInfos> {
  @override
  final typeId = 4355;

  @override
  ExtraInfos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtraInfos(
      totalDuration: (fields[0] as num).toDouble(),
      totalSize: (fields[1] as num).toDouble(),
      bandwidth: (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ExtraInfos obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.totalDuration)
      ..writeByte(1)
      ..write(obj.totalSize)
      ..writeByte(2)
      ..write(obj.bandwidth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtraInfosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
