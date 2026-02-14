// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeModelAdapter extends TypeAdapter<AnimeModel> {
  @override
  final typeId = 10;

  @override
  AnimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeModel(
      id: fields[0] as String,
      title: fields[1] as TranslatedModel,
      description: fields[2] as TranslatedModel,
      slug: fields[5] as String,
      frames: (fields[3] as List?)?.cast<String>(),
      thumbnail: fields[4] as String?,
      trailer: fields[6] as String?,
      age: (fields[7] as num?)?.toInt(),
      cover: fields[8] as String?,
      year: (fields[9] as num?)?.toInt(),
      categories: (fields[15] as List?)?.cast<String>(),
      country: fields[10] as String?,
      creators: (fields[13] as List?)?.cast<String>(),
      director: fields[12] as String?,
      genres: (fields[14] as List?)?.cast<String>(),
      studio: fields[11] as String?,
      onlyForMDH: fields[16] as bool?,
      totalEpisodes: (fields[17] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, AnimeModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.frames)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.slug)
      ..writeByte(6)
      ..write(obj.trailer)
      ..writeByte(7)
      ..write(obj.age)
      ..writeByte(8)
      ..write(obj.cover)
      ..writeByte(9)
      ..write(obj.year)
      ..writeByte(10)
      ..write(obj.country)
      ..writeByte(11)
      ..write(obj.studio)
      ..writeByte(12)
      ..write(obj.director)
      ..writeByte(13)
      ..write(obj.creators)
      ..writeByte(14)
      ..write(obj.genres)
      ..writeByte(15)
      ..write(obj.categories)
      ..writeByte(16)
      ..write(obj.onlyForMDH)
      ..writeByte(17)
      ..write(obj.totalEpisodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CommentModelAdapter extends TypeAdapter<CommentModel> {
  @override
  final typeId = 13;

  @override
  CommentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommentModel(
      id: fields[0] as String,
      dislikes: (fields[4] as num?)?.toInt(),
      likes: (fields[3] as num?)?.toInt(),
      message: fields[1] as String,
      user: fields[2] as User,
    );
  }

  @override
  void write(BinaryWriter writer, CommentModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.likes)
      ..writeByte(4)
      ..write(obj.dislikes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
