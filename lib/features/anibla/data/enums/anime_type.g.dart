// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeTypeAdapter extends TypeAdapter<AnimeType> {
  @override
  final typeId = 1000;

  @override
  AnimeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AnimeType.movie;
      case 1:
        return AnimeType.serie;
      default:
        return AnimeType.movie;
    }
  }

  @override
  void write(BinaryWriter writer, AnimeType obj) {
    switch (obj) {
      case AnimeType.movie:
        writer.writeByte(0);
      case AnimeType.serie:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
