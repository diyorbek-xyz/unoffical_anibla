// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManoProfileAdapter extends TypeAdapter<ManoProfile> {
  @override
  final typeId = 6242;

  @override
  ManoProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManoProfile(
      id: fields[0] == null ? '' : fields[0] as String,
      role: fields[1] == null ? '' : fields[1] as String,
      balance: fields[2] == null ? '0.0' : fields[2] as String,
      warning: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      banned: fields[4] == null ? false : fields[4] as bool,
      createdDate: fields[5] == null ? '' : fields[5] as String,
      paymentId: fields[6] == null ? 0 : (fields[6] as num).toInt(),
      name: fields[7] == null ? '' : fields[7] as String,
      phoneNumber: fields[8] == null ? '' : fields[8] as String,
      avatar: fields[9] == null ? '' : fields[9] as String,
      adminScope: fields[10] == null ? '' : fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ManoProfile obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.warning)
      ..writeByte(4)
      ..write(obj.banned)
      ..writeByte(5)
      ..write(obj.createdDate)
      ..writeByte(6)
      ..write(obj.paymentId)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.phoneNumber)
      ..writeByte(9)
      ..write(obj.avatar)
      ..writeByte(10)
      ..write(obj.adminScope);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManoProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoProfile _$ManoProfileFromJson(Map<String, dynamic> json) => _ManoProfile(
  id: json['id'] as String? ?? "",
  role: json['role'] as String? ?? "",
  balance: json['balance'] as String? ?? "0.0",
  warning: (json['warning'] as num?)?.toInt() ?? 0,
  banned: json['banned'] as bool? ?? false,
  createdDate: json['created_at'] as String? ?? "",
  paymentId: (json['external_user_id'] as num?)?.toInt() ?? 0,
  name: json['first_name'] as String? ?? "",
  phoneNumber: json['phone_number'] as String? ?? "",
  avatar: json['picture_link'] as String? ?? "",
  adminScope: json['admin_scope'] as String? ?? "",
);

Map<String, dynamic> _$ManoProfileToJson(_ManoProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'balance': instance.balance,
      'warning': instance.warning,
      'banned': instance.banned,
      'created_at': instance.createdDate,
      'external_user_id': instance.paymentId,
      'first_name': instance.name,
      'phone_number': instance.phoneNumber,
      'picture_link': instance.avatar,
      'admin_scope': instance.adminScope,
    };
