import 'package:application/data/models/auth/account.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST("/v1/auth/login")
  Future<HttpResponse<Map<String, int>>> loginByNumber(@Body() Map<String, int> body);

  @POST("/v1/auth/verify")
  Future<HttpResponse<AccountResponseModel>> verifyCode(@Body() Map<String, dynamic> body);
}
