import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/shared/models/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi()
abstract class ProfileApi {
  factory ProfileApi(AniblaClient dio) = _ProfileApi;

  @GET('/v1/users/me')
  Future<HttpResponse<ApiResponse<Profile>>> getProfile();

  @PATCH('/v1/users/me')
  Future<HttpResponse<ApiResponse<Profile>>> updateProfile(@Body(nullToAbsent: true) Map<String, dynamic> data);
}
