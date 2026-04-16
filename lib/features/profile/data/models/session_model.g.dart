// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionModelAdapter extends TypeAdapter<SessionModel> {
  @override
  final typeId = 8;

  @override
  SessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionModel(
      device: fields[3] as String?,
      id: fields[0] as String?,
      ip: fields[4] as String?,
      lastIp: fields[6] as String?,
      lastLogin: fields[5] as DateTime?,
      platform: fields[7] as String?,
      tokenId: fields[2] as String?,
      userId: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SessionModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.tokenId)
      ..writeByte(3)
      ..write(obj.device)
      ..writeByte(4)
      ..write(obj.ip)
      ..writeByte(5)
      ..write(obj.lastLogin)
      ..writeByte(6)
      ..write(obj.lastIp)
      ..writeByte(7)
      ..write(obj.platform);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SessionsModelAdapter extends TypeAdapter<SessionsModel> {
  @override
  final typeId = 9;

  @override
  SessionsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionsModel(
      tokenId: fields[0] as String?,
      name: fields[1] as String?,
      sessions: (fields[3] as List?)?.cast<SessionModel>(),
      total: (fields[2] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, SessionsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tokenId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.sessions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
  device: json['device'] as String?,
  id: json['_id'] as String?,
  ip: json['ip'] as String?,
  lastIp: json['last_login_ip'] as String?,
  lastLogin: json['last_login'] == null
      ? null
      : DateTime.parse(json['last_login'] as String),
  platform: json['platform_os'] as String?,
  tokenId: json['token_id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'token_id': instance.tokenId,
      'device': instance.device,
      'ip': instance.ip,
      'last_login': instance.lastLogin?.toIso8601String(),
      'last_login_ip': instance.lastIp,
      'platform_os': instance.platform,
    };

SessionsModel _$SessionsModelFromJson(Map<String, dynamic> json) =>
    SessionsModel(
      tokenId: json['token_id'] as String?,
      name: json['name'] as String?,
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => SessionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SessionsModelToJson(SessionsModel instance) =>
    <String, dynamic>{
      'token_id': instance.tokenId,
      'name': instance.name,
      'total': instance.total,
      'sessions': instance.sessions,
    };
