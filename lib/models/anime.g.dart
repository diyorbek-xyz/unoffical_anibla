// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  final typeId = 1;

  @override
  Anime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      id: fields[0] as String,
      title: fields[1] as Translated,
      description: fields[2] as Translated,
      poster: fields[3] as String,
      thumbnail: fields[4] as String,
      categories: (fields[6] as List).cast<Category>(),
      year: (fields[7] as num).toInt(),
      studio: fields[8] as String,
      director: fields[9] as String,
      views: (fields[5] as num).toInt(),
      isMovie: fields[10] as bool,
      date: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.poster)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.views)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.year)
      ..writeByte(8)
      ..write(obj.studio)
      ..writeByte(9)
      ..write(obj.director)
      ..writeByte(10)
      ..write(obj.isMovie)
      ..writeByte(11)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeriesAdapter extends TypeAdapter<Series> {
  @override
  final typeId = 2;

  @override
  Series read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Series(
      id: fields[0] as String,
      video: fields[1] as String,
      title: fields[2] as Translated,
    );
  }

  @override
  void write(BinaryWriter writer, Series obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.video)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WatchAnimeAdapter extends TypeAdapter<WatchAnime> {
  @override
  final typeId = 3;

  @override
  WatchAnime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchAnime(
      series: (fields[0] as List).cast<Series>(),
      anime: fields[1] as Anime,
      comments: (fields[2] as List?)?.cast<Comment>(),
    );
  }

  @override
  void write(BinaryWriter writer, WatchAnime obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.series)
      ..writeByte(1)
      ..write(obj.anime)
      ..writeByte(2)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchAnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final typeId = 4;

  @override
  Comment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comment(
      id: fields[0] as String,
      dislikes: (fields[4] as num?)?.toInt(),
      likes: (fields[3] as num?)?.toInt(),
      message: fields[1] as String,
      user: fields[2] as User,
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
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
      other is CommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
