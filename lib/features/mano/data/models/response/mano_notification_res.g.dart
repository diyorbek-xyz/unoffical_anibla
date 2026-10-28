// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_notification_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoNotificationRes _$ManoNotificationResFromJson(Map<String, dynamic> json) =>
    _ManoNotificationRes(
      notifications:
          (json['notifications'] as List<dynamic>?)
              ?.map((e) => ManoNotification.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCount: json['total_count'] as String? ?? "0",
    );

Map<String, dynamic> _$ManoNotificationResToJson(
  _ManoNotificationRes instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'total_count': instance.totalCount,
};
