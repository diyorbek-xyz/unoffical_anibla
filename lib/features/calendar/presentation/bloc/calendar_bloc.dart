import 'package:application/core/utils/extensions.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:application/features/calendar/domain/repository/calendar_repository.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_event.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarRepository repository;
  CalendarBloc(this.repository) : super(CalendarLoading()) {
    on<GetCalendar>(onGetCalendar);
    on<GetCalendarWeekly>(onGetWeekly);
  }
  void onGetCalendar(GetCalendar event, Emitter<CalendarState> emit) async {
    emit(CalendarLoading());
    final either = await repository.getCalendar(event.date);
    emit(
      either.fold(
        (failure) => CalendarError(ExceptionMapper.mapFailureToMessage(failure)),
        (calendar) => CalendarSuccess(calendar),
      ),
    );
  }

  void onGetWeekly(GetCalendarWeekly event, Emitter<CalendarState> emit) async {
    emit(CalendarLoading());
    final days = DateTime.now().getWeekDays();
    List<CalendarEntity?> calendars = [];

    for (DateTime day in days) {
      final either = await repository.getCalendar(day);
      calendars.add(
        either.fold(
          (failure) {
            if (failure is NetworkFailure) {
              emit(CalendarError(ExceptionMapper.mapFailureToMessage(failure)));
            }
            return;
          },
          (calendar) {
            calendar.timers.sort((a, b) => a.time.compareTo(b.time));
            return calendar;
          },
        ),
      );
    }
    if (!calendars.every((calendar) => calendar == null)) {
      emit(CalendarWeeklySuccess(calendars));
    }
  }
}
