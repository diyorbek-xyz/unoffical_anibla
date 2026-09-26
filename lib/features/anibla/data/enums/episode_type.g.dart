// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeTypeAdapter extends TypeAdapter<EpisodeType> {
  @override
  final typeId = 5332;

  @override
  EpisodeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EpisodeType.free;
      case 1:
        return EpisodeType.paid;
      default:
        return EpisodeType.free;
    }
  }

  @override
  void write(BinaryWriter writer, EpisodeType obj) {
    switch (obj) {
      case EpisodeType.free:
        writer.writeByte(0);
      case EpisodeType.paid:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
