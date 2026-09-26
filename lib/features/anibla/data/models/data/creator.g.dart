// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreatorAdapter extends TypeAdapter<Creator> {
  @override
  final typeId = 141;

  @override
  Creator read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Creator(
      id: fields[0] == null ? '' : fields[0] as String,
      name: fields[1] == null ? '' : fields[1] as String,
      role: fields[2] == null ? '' : fields[2] as String,
      status: fields[3] == null ? false : fields[3] as bool,
      image: fields[4] == null ? '' : fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Creator obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Creator _$CreatorFromJson(Map<String, dynamic> json) => _Creator(
  id: json['id'] as String? ?? "",
  name: json['name'] as String? ?? "",
  role: json['role'] as String? ?? "",
  status: json['status'] as bool? ?? false,
  image: json['image'] == null ? "" : addBaseUrl(json['image'] as String?),
);

Map<String, dynamic> _$CreatorToJson(_Creator instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'role': instance.role,
  'status': instance.status,
  'image': instance.image,
};
