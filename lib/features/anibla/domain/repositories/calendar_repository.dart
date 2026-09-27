import 'package:application/features/anibla/data/models/misc/calendar.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CalendarRepository {
  Future<Either<Failure, Calendar>> getCalendar(DateTime date);
}
