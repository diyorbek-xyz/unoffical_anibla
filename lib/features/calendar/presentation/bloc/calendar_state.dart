import 'package:application/features/calendar/domain/entities/calendar_entity.dart';

sealed class CalendarState {
  const CalendarState();
}

final class CalendarInitial extends CalendarState {
  const CalendarInitial();
}

final class CalendarLoading extends CalendarState {
  const CalendarLoading();
}

final class CalendarFullSuccess extends CalendarState {
  final List<CalendarEntity> data;
  const CalendarFullSuccess(this.data);
}

final class CalendarSuccess extends CalendarState {
  final CalendarEntity data;
  const CalendarSuccess(this.data);
}

final class CalendarError extends CalendarState {
  final String message;
  const CalendarError(this.message);
}
