import 'dart:io';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/calendar/data/models/calendar_model.dart';
import 'package:application/features/calendar/data/source/local/calendar_local.dart';
import 'package:application/features/calendar/data/source/remote/calendar_api.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:application/features/calendar/domain/repository/calendar_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarApi calendarApi;
  final CalendarLocal calendarLocal;
  const CalendarRepositoryImpl(this.calendarApi, this.calendarLocal);

  @override
  Future<Either<Failure, CalendarEntity>> getCalendar(DateTime date) async {
    try {
      final httpResponse = await calendarApi.getCalendar(date.formatCompact());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final model = CalendarModel.fromJson(httpResponse.data.data, date);
        await calendarLocal.saveCalendar(model);
        return Right(model.toEntity());
      } else {
        final local = await calendarLocal.getCalendar(date);
        return Right(local!.toEntity());
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
