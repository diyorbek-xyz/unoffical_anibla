import 'package:application/core/resources/api_response.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("/v1/auth/login")
  Future<HttpResponse<LoginResponseModel>> getConfirm(@Body() LoginRequestModel body);

  @POST("/v1/auth/verify")
  Future<HttpResponse<ConfirmedModel>> confirmCode(@Body() ConfirmModel body);

  @DELETE("/v1/sessions/{tokenId}")
  Future<HttpResponse<ApiResponse<dynamic>>> exitSession(@Path("tokenId") String tokenId);
}
