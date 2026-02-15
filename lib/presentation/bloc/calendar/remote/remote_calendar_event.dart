import 'package:application/data/models/param_models/calendar_params.dart';

sealed class RemoteCalendarEvent {
  const RemoteCalendarEvent();
}

final class GetCalendar extends RemoteCalendarEvent {
  final CalendarParams params;
  const GetCalendar(this.params);
}
