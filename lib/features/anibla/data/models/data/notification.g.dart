// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationAdapter extends TypeAdapter<Notification> {
  @override
  final typeId = 5124;

  @override
  Notification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notification(
      id: fields[0] == null ? '' : fields[0] as String,
      userId: fields[1] == null ? '' : fields[1] as String,
      title: fields[2] == null ? '' : fields[2] as String,
      body: fields[3] == null ? '' : fields[3] as String,
      type: fields[4] == null ? '' : fields[4] as String,
      read: fields[5] == null ? false : fields[5] as bool,
      createdAt: fields[6] == null ? '' : fields[6] as String,
      updatedAt: fields[7] == null ? '' : fields[7] as String,
      data: fields[8] == null
          ? const EpisodeNotification()
          : fields[8] as EpisodeNotification,
    );
  }

  @override
  void write(BinaryWriter writer, Notification obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.body)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.read)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: json['_id'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      title: json['title'] as String? ?? "",
      body: json['body'] as String? ?? "",
      type: json['type'] as String? ?? "",
      read: json['read'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? "",
      updatedAt: json['updatedAt'] as String? ?? "",
      data: json['data'] == null
          ? const EpisodeNotification()
          : EpisodeNotification.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'read': instance.read,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'data': instance.data,
    };
