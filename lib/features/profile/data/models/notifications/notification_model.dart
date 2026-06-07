import 'package:application/features/profile/data/models/notifications/ep_notif_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
@HiveType(typeId: 5124)
sealed class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    @HiveField(0) @JsonKey(name: "_id") String? id,
    @HiveField(1) String? userId,
    @HiveField(2) String? title,
    @HiveField(3) String? body,
    @HiveField(4) String? type,
    @HiveField(5) bool? read,
    @HiveField(6) DateTime? createdAt,
    @HiveField(7) DateTime? updatedAt,
    @HiveField(8) EpisodeNotificationModel? data,
  }) = _NotificationModel;
  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}
