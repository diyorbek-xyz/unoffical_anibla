import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/param_models/calendar_params.dart';
import 'package:application/domain/entities/other/calendar_entity.dart';

abstract class CalendarRepository {
  Future<DataState<CalendarEntity>> getCalendar(CalendarParams params);
}
