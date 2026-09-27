import 'package:application/core/resources/api_response.dart';
import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi()
abstract class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET('/v1/users/me')
  Future<HttpResponse<ApiResponse<Profile>>> getProfile();
}
