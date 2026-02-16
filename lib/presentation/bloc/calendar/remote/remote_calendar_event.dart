sealed class RemoteCalendarEvent {
  const RemoteCalendarEvent();
}

final class GetCalendar extends RemoteCalendarEvent {
  final List<DateTime> params;
  const GetCalendar(this.params);
}
