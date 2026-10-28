import 'package:application/features/mano/data/models/enum/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "mano_notification_req.g.dart";
part "mano_notification_req.freezed.dart";

@freezed
abstract class ManoNotificationReq with _$ManoNotificationReq {
  const factory ManoNotificationReq({@Default(1) int page, @Default(10) int limit, NotificationStatus? status}) =
      _ManoNotificationReq;

  factory ManoNotificationReq.fromJson(Map<String, dynamic> json) => _$ManoNotificationReqFromJson(json);
}
