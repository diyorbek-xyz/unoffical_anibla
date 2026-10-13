// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManoCategoryAdapter extends TypeAdapter<ManoCategory> {
  @override
  final typeId = 5322;

  @override
  ManoCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManoCategory(
      id: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ManoCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManoCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoCategory _$ManoCategoryFromJson(Map<String, dynamic> json) =>
    _ManoCategory(
      id: json['category_id'] as String? ?? "",
      title: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$ManoCategoryToJson(_ManoCategory instance) =>
    <String, dynamic>{'category_id': instance.id, 'name': instance.title};
