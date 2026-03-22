sealed class CalendarEvent {}

final class GetCalendar extends CalendarEvent {
  final DateTime date;
  GetCalendar(this.date);
}
