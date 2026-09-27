import 'package:application/features/anibla/data/models/data/episode_notf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
@HiveType(typeId: 104)
abstract class Notification with _$Notification {
  const factory Notification({
    @Default("") @HiveField(0) @JsonKey(name: "_id") String id,
    @Default("") @HiveField(1) String userId,
    @Default("") @HiveField(2) String title,
    @Default("") @HiveField(3) String body,
    @Default("") @HiveField(4) String type,
    @Default(false) @HiveField(5) bool read,
    @Default("") @HiveField(6) String createdAt,
    @Default("") @HiveField(7) String updatedAt,
    @Default(EpisodeNotification()) @HiveField(8) EpisodeNotification data,
  }) = _Notification;
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
