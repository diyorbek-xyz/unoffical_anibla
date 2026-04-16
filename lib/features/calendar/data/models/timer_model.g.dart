// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerModelAdapter extends TypeAdapter<TimerModel> {
  @override
  final typeId = 4;

  @override
  TimerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimerModel(
      anime: fields[0] as AnimeModel?,
      id: fields[1] as String?,
      time: fields[3] as DateTime?,
      type: fields[4] as String?,
      episode: fields[5] as EpisodeModel?,
    );
  }

  @override
  void write(BinaryWriter writer, TimerModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.anime)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.episode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimerModel _$TimerModelFromJson(Map<String, dynamic> json) => TimerModel(
  anime: json['media'] == null ? null : AnimeModel.fromJson(json['media']),
  id: json['_id'] as String?,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
  type: json['mediaType'] as String?,
  episode: json['episode_id'] == null
      ? null
      : EpisodeModel.fromJson(json['episode_id'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TimerModelToJson(TimerModel instance) =>
    <String, dynamic>{
      'media': instance.anime,
      '_id': instance.id,
      'time': instance.time?.toIso8601String(),
      'mediaType': instance.type,
      'episode_id': instance.episode,
    };
