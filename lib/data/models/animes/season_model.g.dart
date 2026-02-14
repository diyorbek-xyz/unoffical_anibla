// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonModelAdapter extends TypeAdapter<SeasonModel> {
  @override
  final typeId = 11;

  @override
  SeasonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeasonModel(
      id: fields[0] as String,
      seasonNumber: (fields[2] as num).toInt(),
      title: fields[1] as TranslatedModel,
      anime: fields[3] as AnimeModel?,
      slug: fields[5] as String?,
      animeId: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SeasonModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.seasonNumber)
      ..writeByte(3)
      ..write(obj.anime)
      ..writeByte(4)
      ..write(obj.animeId)
      ..writeByte(5)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
