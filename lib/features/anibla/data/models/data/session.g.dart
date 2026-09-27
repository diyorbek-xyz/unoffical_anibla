// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionAdapter extends TypeAdapter<Session> {
  @override
  final typeId = 8;

  @override
  Session read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Session(
      id: fields[0] == null ? '' : fields[0] as String,
      userId: fields[1] == null ? '' : fields[1] as String,
      tokenId: fields[2] == null ? '' : fields[2] as String,
      lastLogin: fields[5] == null ? '' : fields[5] as String,
      lastIp: fields[6] == null ? '' : fields[6] as String,
      platform: fields[7] == null ? '' : fields[7] as String,
      device: fields[3] == null ? '' : fields[3] as String,
      ip: fields[4] == null ? '' : fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Session obj) {
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
      other is SessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SessionsAdapter extends TypeAdapter<Sessions> {
  @override
  final typeId = 9;

  @override
  Sessions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sessions(
      tokenId: fields[0] == null ? '' : fields[0] as String,
      name: fields[1] == null ? '' : fields[1] as String,
      total: fields[2] == null ? 0 : (fields[2] as num).toInt(),
      sessions: fields[3] == null ? [] : (fields[3] as List).cast<Session>(),
    );
  }

  @override
  void write(BinaryWriter writer, Sessions obj) {
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
      other is SessionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['_id'] as String? ?? "",
  userId: json['user_id'] as String? ?? "",
  tokenId: json['token_id'] as String? ?? "",
  lastLogin: json['last_login'] as String? ?? "",
  lastIp: json['last_login_ip'] as String? ?? "",
  platform: json['platform_os'] as String? ?? "",
  device: json['device'] as String? ?? "",
  ip: json['ip'] as String? ?? "",
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  '_id': instance.id,
  'user_id': instance.userId,
  'token_id': instance.tokenId,
  'last_login': instance.lastLogin,
  'last_login_ip': instance.lastIp,
  'platform_os': instance.platform,
  'device': instance.device,
  'ip': instance.ip,
};

_Sessions _$SessionsFromJson(Map<String, dynamic> json) => _Sessions(
  tokenId: json['token_id'] as String? ?? "",
  name: json['name'] as String? ?? "",
  total: (json['total'] as num?)?.toInt() ?? 0,
  sessions:
      (json['sessions'] as List<dynamic>?)
          ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SessionsToJson(_Sessions instance) => <String, dynamic>{
  'token_id': instance.tokenId,
  'name': instance.name,
  'total': instance.total,
  'sessions': instance.sessions,
};
