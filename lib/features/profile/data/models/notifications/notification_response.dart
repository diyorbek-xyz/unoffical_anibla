import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:application/features/profile/data/models/notifications/notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

@freezed
@HiveType(typeId: 6143)
sealed class NotificationResponse with _$NotificationResponse {
  factory NotificationResponse({@HiveField(0) List<NotificationModel>? data, @HiveField(1) int? unreadCount, @HiveField(2) Pagination? pagination}) =
      _NotificationResponse;
  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);
}
