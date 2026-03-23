import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi()
abstract class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET('/v1/users/me')
  Future<HttpResponse<dynamic>> getProfile();
}
