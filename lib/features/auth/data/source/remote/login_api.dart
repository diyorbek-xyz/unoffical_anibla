import 'package:application/features/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) = _LoginApi;

  @POST("/v1/auth/login")
  Future<HttpResponse<LoginResponseModel>> getConfirm(@Body() LoginRequestModel body);


  @POST("/v1/auth/verify")
  Future<HttpResponse<ConfirmedModel>> confirmCode(@Body() ConfirmModel body);

}
