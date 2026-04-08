// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationAdapter extends TypeAdapter<Pagination> {
  @override
  final typeId = 0;

  @override
  Pagination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pagination(
      limit: fields[0] == null ? 0 : (fields[0] as num).toInt(),
      total: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      pages: fields[2] == null ? 0 : (fields[2] as num).toInt(),
      page: fields[1] == null ? 0 : (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Pagination obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.limit)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.pages)
      ..writeByte(3)
      ..write(obj.total);
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

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
  pages: (json['pages'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
      'total': instance.total,
    };
