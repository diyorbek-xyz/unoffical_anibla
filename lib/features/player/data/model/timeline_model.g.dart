// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineModelAdapter extends TypeAdapter<TimelineModel> {
  @override
  final typeId = 7182;

  @override
  TimelineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelineModel(
      duration: fields[1] as Duration,
      progress: fields[0] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.progress)
      ..writeByte(1)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
