import 'package:application/presentation/model/calendar_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteCalendarState extends Equatable {
  final CalendarUiModel? calendar;
  final DioException? exception;
  const RemoteCalendarState({this.calendar, this.exception});

  @override
  List<Object?> get props => [calendar, exception];
}

final class RemoteCalendarLoading extends RemoteCalendarState {
  const RemoteCalendarLoading();
}

final class RemoteCalendarDone extends RemoteCalendarState {
  const RemoteCalendarDone(CalendarUiModel calendar) : super(calendar: calendar);
}

final class RemoteCalendarFailed extends RemoteCalendarState {
  const RemoteCalendarFailed(DioException exception) : super(exception: exception);
}
