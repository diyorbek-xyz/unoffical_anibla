import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/features/mano/data/models/request/mano_notification_req.dart';
import 'package:application/features/mano/data/models/response/mano_notification_res.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'mano_notification_api.g.dart';

@RestApi()
abstract class ManoNotificationApi {
  factory ManoNotificationApi(ManoClient client) = _ManoNotificationApi;

  @GET("/v2/notification")
  Future<HttpResponse<ManoNotificationRes>> getNotifications(@Queries() ManoNotificationReq request);
}
