part of 'notification_bloc.dart';

@freezed
sealed class NotificationState with _$NotificationState {
  factory NotificationState.success(NotificationResponseEntity response) = _Success;
  factory NotificationState.failed(String message) = _Failed;
  factory NotificationState.initial() = _Initial;
  factory NotificationState.loading() = _Loading;
}