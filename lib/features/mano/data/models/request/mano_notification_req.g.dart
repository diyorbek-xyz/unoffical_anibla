// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_notification_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoNotificationReq _$ManoNotificationReqFromJson(Map<String, dynamic> json) =>
    _ManoNotificationReq(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      status: $enumDecodeNullable(_$NotificationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ManoNotificationReqToJson(
  _ManoNotificationReq instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'status': _$NotificationStatusEnumMap[instance.status],
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.read: 'read',
  NotificationStatus.unread: 'unread',
};
