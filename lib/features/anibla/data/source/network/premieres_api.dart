import 'package:application/core/network/clients/anibla_client.dart';
import 'package:application/shared/models/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'premieres_api.g.dart';

@RestApi()
abstract class PremieresApi {
  factory PremieresApi(AniblaClient dio) = _PremieresApi;

  @GET('/v1/timer/time/{date}')
  Future<HttpResponse<ApiResponse<dynamic>>> getPremieres(@Path("date") String date, {@Query("limit") int limit = 10});
}
