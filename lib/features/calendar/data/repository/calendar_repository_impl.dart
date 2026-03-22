import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/calendar/data/models/calendar_model.dart';
import 'package:application/features/calendar/data/source/local/calendar_local.dart';
import 'package:application/features/calendar/data/source/remote/calendar_api.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:application/features/calendar/domain/repository/calendar_repository.dart';
import 'package:dio/dio.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarApi calendarApi;
  final CalendarLocal calendarLocal;
  const CalendarRepositoryImpl(this.calendarApi, this.calendarLocal);

  @override
  Future<DataState<CalendarEntity>> getCalendar(DateTime date) async {
    try {
      final httpResponse = await calendarApi.getCalendar(date.formatCompact());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final model = CalendarModel.fromJson(httpResponse.data.data, date);
        await calendarLocal.saveCalendar(model);
        return DataSuccess(model.toEntity());
      } else {
        try {
          final local = await calendarLocal.getCalendar(date);
          return DataSuccess(local!.toEntity());
        } catch (e) {
          return DataFailed(DioException(requestOptions: httpResponse.response.requestOptions), httpResponse.response);
        }
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
