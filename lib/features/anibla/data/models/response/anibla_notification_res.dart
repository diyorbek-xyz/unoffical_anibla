import 'package:application/features/anibla/data/models/data/anibla_notification.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'anibla_notification_res.freezed.dart';
part 'anibla_notification_res.g.dart';

@freezed
@HiveType(typeId: 901)
abstract class AniblaNotificationRes with _$AniblaNotificationRes {
  const factory AniblaNotificationRes({
    @Default([]) @HiveField(0) List<AniblaNotification> data,
    @Default(0) @HiveField(1) int unreadCount,
    @Default(Pagination()) @HiveField(2) Pagination pagination,
  }) = _AniblaNotificationRes;
  factory AniblaNotificationRes.fromJson(Map<String, dynamic> json) => _$AniblaNotificationResFromJson(json);
}
