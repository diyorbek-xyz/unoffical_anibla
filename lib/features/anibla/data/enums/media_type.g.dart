// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaTypeAdapter extends TypeAdapter<MediaType> {
  @override
  final typeId = 1002;

  @override
  MediaType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MediaType.movie;
      case 1:
        return MediaType.serie;
      case 2:
        return MediaType.manga;
      case 3:
        return MediaType.manxva;
      case 4:
        return MediaType.novel;
      case 5:
        return MediaType.comics;
      default:
        return MediaType.movie;
    }
  }

  @override
  void write(BinaryWriter writer, MediaType obj) {
    switch (obj) {
      case MediaType.movie:
        writer.writeByte(0);
      case MediaType.serie:
        writer.writeByte(1);
      case MediaType.manga:
        writer.writeByte(2);
      case MediaType.manxva:
        writer.writeByte(3);
      case MediaType.novel:
        writer.writeByte(4);
      case MediaType.comics:
        writer.writeByte(5);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
