import 'package:application/features/profile/data/models/notifications/notification_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_api.g.dart';

@RestApi()
abstract class NotificationsApi {
  factory NotificationsApi(Dio dio) = _NotificationsApi;

  @GET("/v1/notifications")
  Future<NotificationResponse> getNotifications();
}
