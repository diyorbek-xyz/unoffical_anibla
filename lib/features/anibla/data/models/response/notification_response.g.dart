// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationResponseAdapter extends TypeAdapter<NotificationResponse> {
  @override
  final typeId = 6143;

  @override
  NotificationResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationResponse(
      data: fields[0] == null ? [] : (fields[0] as List).cast<Notification>(),
      unreadCount: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      pagination: fields[2] == null
          ? const Pagination()
          : fields[2] as Pagination,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.unreadCount)
      ..writeByte(2)
      ..write(obj.pagination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationResponse _$NotificationResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
  pagination: json['pagination'] == null
      ? const Pagination()
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationResponseToJson(
  _NotificationResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'unreadCount': instance.unreadCount,
  'pagination': instance.pagination,
};
