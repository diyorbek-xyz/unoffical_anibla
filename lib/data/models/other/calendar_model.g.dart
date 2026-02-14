// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarModelAdapter extends TypeAdapter<CalendarModel> {
  @override
  final typeId = 20;

  @override
  CalendarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarModel(
      pagination: fields[1] as PaginationModel?,
      timers: (fields[0] as List?)?.cast<ReleaseTimerModel>(),
      day: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timers)
      ..writeByte(1)
      ..write(obj.pagination)
      ..writeByte(2)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReleaseTimerModelAdapter extends TypeAdapter<ReleaseTimerModel> {
  @override
  final typeId = 21;

  @override
  ReleaseTimerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReleaseTimerModel(
      id: fields[0] as String,
      message: fields[1] as TranslatedModel,
      time: fields[2] as DateTime,
      anime: fields[3] as AnimeModel,
      episode: fields[5] as EpisodeModel,
      season: fields[4] as SeasonModel,
      totalEpisodes: (fields[6] as num).toInt(),
      type: fields[7] as AnimeType,
    );
  }

  @override
  void write(BinaryWriter writer, ReleaseTimerModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.anime)
      ..writeByte(4)
      ..write(obj.season)
      ..writeByte(5)
      ..write(obj.episode)
      ..writeByte(6)
      ..write(obj.totalEpisodes)
      ..writeByte(7)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReleaseTimerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
