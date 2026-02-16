import 'package:application/domain/entities/other/calendar_entity.dart';
import 'package:application/presentation/model/calendar_ui.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class RemoteCalendarState extends Equatable {
  final List<CalendarUiModel>? list;
  final DioException? exception;
  const RemoteCalendarState({this.list, this.exception});

  @override
  List<Object?> get props => [list, exception];
}

final class RemoteCalendarLoading extends RemoteCalendarState {
  RemoteCalendarLoading()
    : super(
        list: List.generate(7, (index) => CalendarUiModel.fromEntity(CalendarEntity(releases: List.generate(2, (index) => TimerEntity())))),
      );
}

final class RemoteCalendarDone extends RemoteCalendarState {
  const RemoteCalendarDone(List<CalendarUiModel> list) : super(list: list);
}

final class RemoteCalendarFailed extends RemoteCalendarState {
  const RemoteCalendarFailed(DioException exception) : super(exception: exception);
}
