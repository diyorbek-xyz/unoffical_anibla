// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premieres.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PremieresAdapter extends TypeAdapter<Premieres> {
  @override
  final typeId = 302;

  @override
  Premieres read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Premieres(
      pagination: fields[0] == null
          ? const Pagination()
          : fields[0] as Pagination,
      date: fields[2] == null ? '' : fields[2] as String,
      premieres: fields[1] == null ? [] : (fields[1] as List).cast<Premiere>(),
    );
  }

  @override
  void write(BinaryWriter writer, Premieres obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pagination)
      ..writeByte(1)
      ..write(obj.premieres)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PremieresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Premieres _$PremieresFromJson(Map<String, dynamic> json) => _Premieres(
  pagination: json['pagination'] == null
      ? const Pagination()
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  date: json['date'] as String? ?? "",
  premieres:
      (json['timers'] as List<dynamic>?)
          ?.map((e) => Premiere.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PremieresToJson(_Premieres instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'date': instance.date,
      'timers': instance.premieres,
    };
