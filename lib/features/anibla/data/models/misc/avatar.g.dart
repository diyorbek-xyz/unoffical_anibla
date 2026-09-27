// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AvatarAdapter extends TypeAdapter<Avatar> {
  @override
  final typeId = 9345;

  @override
  Avatar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Avatar(
      id: fields[0] == null ? '' : fields[0] as String,
      avatar: fields[1] == null ? '' : fields[1] as String,
      createdAt: fields[2] == null ? '' : fields[2] as String,
      updatedAt: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Avatar obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvatarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Avatar _$AvatarFromJson(Map<String, dynamic> json) => _Avatar(
  id: json['_id'] as String? ?? "",
  avatar: json['avatar'] as String? ?? "",
  createdAt: json['createdAt'] as String? ?? "",
  updatedAt: json['updatedAt'] as String? ?? "",
);

Map<String, dynamic> _$AvatarToJson(_Avatar instance) => <String, dynamic>{
  '_id': instance.id,
  'avatar': instance.avatar,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
