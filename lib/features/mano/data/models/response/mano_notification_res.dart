import 'package:application/features/mano/data/models/data/mano_notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_notification_res.g.dart';
part 'mano_notification_res.freezed.dart';

@freezed
abstract class ManoNotificationRes with _$ManoNotificationRes {
  const factory ManoNotificationRes({
    @Default([]) List<ManoNotification> notifications,
    @Default("0") @JsonKey(name: "total_count") String totalCount,
  }) = _ManoNotificationRes;

  factory ManoNotificationRes.fromJson(Map<String, dynamic> json) => _$ManoNotificationResFromJson(json);
}
