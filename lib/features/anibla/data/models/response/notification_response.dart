import 'package:application/features/anibla/data/models/data/notification.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

@freezed
@HiveType(typeId: 901)
abstract class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    @Default([]) @HiveField(0) List<Notification> data,
    @Default(0) @HiveField(1) int unreadCount,
    @Default(Pagination()) @HiveField(2) Pagination pagination,
  }) = _NotificationResponse;
  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);
}
