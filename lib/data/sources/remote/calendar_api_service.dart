import 'package:application/data/models/param_models/calendar_params.dart';
import 'package:application/data/models/response_models/calendar_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'calendar_api_service.g.dart';

@RestApi()
abstract class CalendarApiService {
  factory CalendarApiService(Dio dio) = _CalendarApiService;

  @GET("/v1/timer/time/{time}")
  Future<HttpResponse<CalendarResponseModel>> getCalendar(@Path("time") GetCalendarParams time);
}
