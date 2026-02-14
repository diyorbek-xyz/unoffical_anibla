// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeModelAdapter extends TypeAdapter<EpisodeModel> {
  @override
  final typeId = 12;

  @override
  EpisodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeModel(
      id: fields[0] as String,
      episodeNumber: (fields[2] as num).toInt(),
      title: fields[1] as TranslatedModel,
      anime: fields[3] as AnimeModel,
      price: fields[5] as AnimePrice,
      video: fields[6] as String?,
      slug: fields[7] as String,
      season: fields[4] as SeasonModel?,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.episodeNumber)
      ..writeByte(3)
      ..write(obj.anime)
      ..writeByte(4)
      ..write(obj.season)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.video)
      ..writeByte(7)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
