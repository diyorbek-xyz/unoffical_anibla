import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CalendarRepository {
  Future<Either<Failure, CalendarEntity>> getCalendar(DateTime date);
}
