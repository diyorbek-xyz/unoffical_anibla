import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:dio/dio.dart';

sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}

final class CalendarLoading extends CalendarState {}

final class CalendarFullSuccess extends CalendarState {
  final List<CalendarEntity> data;
  CalendarFullSuccess(this.data);
}

final class CalendarSuccess extends CalendarState {
  final CalendarEntity data;
  CalendarSuccess(this.data);
}

final class CalendarError extends CalendarState {
  final Response? response;
  final DioException exception;
  CalendarError(this.exception, [this.response]);
}
