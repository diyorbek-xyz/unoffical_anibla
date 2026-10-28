import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/features/anibla/data/models/response/anibla_notification_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_api.g.dart';

@RestApi()
abstract class NotificationsApi {
  factory NotificationsApi(AniblaClient dio) = _NotificationsApi;

  @GET("/v1/notifications")
  Future<AniblaNotificationRes> getNotifications();
}
