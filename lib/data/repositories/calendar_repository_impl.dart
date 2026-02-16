import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/core/resources/dio_exception.dart';
import 'package:application/data/models/param_models/calendar_params.dart';
import 'package:application/data/sources/remote/calendar_api_service.dart';
import 'package:application/domain/entities/other/calendar_entity.dart';
import 'package:application/domain/repositories/calendar_repository.dart';
import 'package:dio/dio.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarApiService _calendarApiService;
  const CalendarRepositoryImpl(this._calendarApiService);

  @override
  Future<DataState<CalendarEntity>> getCalendar(GetCalendarParams params) async {
    try {
      final httpResponse = await _calendarApiService.getCalendar(params);
      if (httpResponse.data.success && httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntity());
      } else {
        return DataFailed(DataException(httpResponse.response).scream());
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
