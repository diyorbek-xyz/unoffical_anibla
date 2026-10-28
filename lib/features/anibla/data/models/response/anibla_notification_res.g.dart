// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anibla_notification_res.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AniblaNotificationResAdapter extends TypeAdapter<AniblaNotificationRes> {
  @override
  final typeId = 901;

  @override
  AniblaNotificationRes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AniblaNotificationRes(
      data: fields[0] == null
          ? []
          : (fields[0] as List).cast<AniblaNotification>(),
      unreadCount: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      pagination: fields[2] == null
          ? const Pagination()
          : fields[2] as Pagination,
    );
  }

  @override
  void write(BinaryWriter writer, AniblaNotificationRes obj) {
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
      other is AniblaNotificationResAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AniblaNotificationRes _$AniblaNotificationResFromJson(
  Map<String, dynamic> json,
) => _AniblaNotificationRes(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => AniblaNotification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
  pagination: json['pagination'] == null
      ? const Pagination()
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AniblaNotificationResToJson(
  _AniblaNotificationRes instance,
) => <String, dynamic>{
  'data': instance.data,
  'unreadCount': instance.unreadCount,
  'pagination': instance.pagination,
};
