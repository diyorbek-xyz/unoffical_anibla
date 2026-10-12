import 'package:application/core/network/clients/mano_client.dart';
import 'package:application/features/anibla/data/models/main/mano_profile.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "mano_profile_api.g.dart";

@RestApi()
abstract class ManoProfileApi {
  factory ManoProfileApi(ManoClient dio) = _ManoProfileApi;

  @GET("/v2/user/{id}")
  Future<HttpResponse<ManoProfile>> getProfile(@Path("id") String id);

  @PUT("/v2/user/{id}")
  Future<HttpResponse<ManoProfile>> updateProfile(@Path("id") String id, @Body() Map<String, dynamic> body);
}
