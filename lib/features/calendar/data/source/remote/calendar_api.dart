import 'package:application/core/resources/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'calendar_api.g.dart';

@RestApi()
abstract class CalendarApi {
  factory CalendarApi(Dio dio) = _CalendarApi;

  @GET('/v1/timer/time/{date}')
  Future<HttpResponse<ApiResponse<dynamic>>> getCalendar(
    @Path("date") String date, {
    @Query("limit") limit = 10,
  });
}
