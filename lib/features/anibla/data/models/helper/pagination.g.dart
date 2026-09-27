// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationAdapter extends TypeAdapter<Pagination> {
  @override
  final typeId = 2;

  @override
  Pagination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pagination(
      limit: fields[0] == null ? 0 : (fields[0] as num).toInt(),
      page: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      pages: fields[2] == null ? 0 : (fields[2] as num).toInt(),
      total: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      next: fields[4] == null ? 0 : (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Pagination obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.limit)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.pages)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.next);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 0,
  pages: (json['pages'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
  next: (json['next'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
      'total': instance.total,
      'next': instance.next,
    };
