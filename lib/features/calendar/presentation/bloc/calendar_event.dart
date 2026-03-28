sealed class CalendarEvent {
  const CalendarEvent();
}

final class GetCalendar extends CalendarEvent {
  final DateTime date;
  const GetCalendar(this.date);
}

final class GetCalendarWeekly extends CalendarEvent {
  const GetCalendarWeekly();
}
