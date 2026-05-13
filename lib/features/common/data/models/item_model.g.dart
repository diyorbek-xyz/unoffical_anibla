// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final typeId = 141;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      id: fields[4] as String?,
      image: fields[1] as String?,
      name: fields[0] as String?,
      role: fields[2] as String?,
      status: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
  id: json['id'] as String?,
  image: addBaseUrl(json['image'] as String?),
  name: json['name'] as String?,
  role: json['role'] as String?,
  status: json['status'] as bool?,
);

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'role': instance.role,
  'status': instance.status,
};
