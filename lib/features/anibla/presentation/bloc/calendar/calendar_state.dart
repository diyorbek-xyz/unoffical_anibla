import 'package:application/features/anibla/data/models/misc/premieres.dart';

sealed class CalendarState {
  const CalendarState();
}

final class CalendarInitial extends CalendarState {
  const CalendarInitial();
}

final class CalendarLoading extends CalendarState {
  const CalendarLoading();
}

final class CalendarSuccess extends CalendarState {
  final Premieres data;
  const CalendarSuccess(this.data);
}

final class CalendarWeeklySuccess extends CalendarState {
  final List<Premieres?> data;
  const CalendarWeeklySuccess(this.data);
}

final class CalendarError extends CalendarState {
  final String message;
  const CalendarError(this.message);
}
