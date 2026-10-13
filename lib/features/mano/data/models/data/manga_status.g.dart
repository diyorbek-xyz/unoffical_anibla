// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaStatusAdapter extends TypeAdapter<MangaStatus> {
  @override
  final typeId = 5326;

  @override
  MangaStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MangaStatus.continuing;
      case 1:
        return MangaStatus.stopped;
      case 2:
        return MangaStatus.finished;
      default:
        return MangaStatus.continuing;
    }
  }

  @override
  void write(BinaryWriter writer, MangaStatus obj) {
    switch (obj) {
      case MangaStatus.continuing:
        writer.writeByte(0);
      case MangaStatus.stopped:
        writer.writeByte(1);
      case MangaStatus.finished:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
