import 'package:application/core/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/calendar.dart';
import 'package:application/features/anibla/data/source/local/calendar_local.dart';
import 'package:application/features/anibla/data/source/network/calendar_api.dart';
import 'package:application/features/anibla/domain/repositories/calendar_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarApi calendarApi;
  final CalendarLocal calendarLocal;
  const CalendarRepositoryImpl(this.calendarApi, this.calendarLocal);

  @override
  Future<Either<Failure, Calendar>> getCalendar(DateTime date) async {
    try {
      try {
        final httpResponse = await calendarApi.getCalendar(date.formatCompact());
        final model = Calendar.fromJson(httpResponse.data.data).copyWith(date: date.toString());
        await calendarLocal.saveCalendar(model);
        return Right(model);
      } on DioException catch (e) {
        final failure = ExceptionMapper.mapDioToFailure(e);
        if (failure is NetworkFailure) {
          final local = await calendarLocal.getCalendar(date);
          if (local != null) return Right(local);
        }
        rethrow;
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
