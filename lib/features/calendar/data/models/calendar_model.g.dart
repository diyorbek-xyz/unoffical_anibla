// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarModelAdapter extends TypeAdapter<CalendarModel> {
  @override
  final typeId = 3;

  @override
  CalendarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarModel(
      pagination: fields[0] as Pagination?,
      timers: (fields[1] as List?)?.cast<TimerModel>(),
      date: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pagination)
      ..writeByte(1)
      ..write(obj.timers)
      ..writeByte(2)
      ..write(obj.date);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarModel _$CalendarModelFromJson(Map<String, dynamic> json) =>
    _CalendarModel(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      timers: (json['timers'] as List<dynamic>?)
          ?.map((e) => TimerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$CalendarModelToJson(_CalendarModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'timers': instance.timers,
      'date': instance.date?.toIso8601String(),
    };
