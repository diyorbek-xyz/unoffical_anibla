import 'package:application/core/resources/data_state.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';

abstract class CalendarRepository {
  Future<DataState<CalendarEntity>> getCalendar(DateTime date);
}
