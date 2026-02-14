// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeTypeAdapter extends TypeAdapter<AnimeType> {
  @override
  final typeId = 20;

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

class AnimePriceAdapter extends TypeAdapter<AnimePrice> {
  @override
  final typeId = 21;

  @override
  AnimePrice read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AnimePrice.free;
      case 1:
        return AnimePrice.paid;
      default:
        return AnimePrice.free;
    }
  }

  @override
  void write(BinaryWriter writer, AnimePrice obj) {
    switch (obj) {
      case AnimePrice.free:
        writer.writeByte(0);
      case AnimePrice.paid:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimePriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
