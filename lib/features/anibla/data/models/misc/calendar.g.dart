// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarAdapter extends TypeAdapter<Calendar> {
  @override
  final typeId = 3;

  @override
  Calendar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Calendar(
      pagination: fields[0] == null
          ? const Pagination()
          : fields[0] as Pagination,
      timers: fields[1] == null ? [] : (fields[1] as List).cast<Timer>(),
      date: fields[2] == null ? '' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Calendar obj) {
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
      other is CalendarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Calendar _$CalendarFromJson(Map<String, dynamic> json) => _Calendar(
  pagination: json['pagination'] == null
      ? const Pagination()
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  timers:
      (json['timers'] as List<dynamic>?)
          ?.map((e) => Timer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  date: json['date'] as String? ?? "",
);

Map<String, dynamic> _$CalendarToJson(_Calendar instance) => <String, dynamic>{
  'pagination': instance.pagination,
  'timers': instance.timers,
  'date': instance.date,
};
