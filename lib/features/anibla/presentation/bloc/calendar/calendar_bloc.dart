import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/premieres.dart';
import 'package:application/features/anibla/domain/repositories/premieres_repository.dart';
import 'package:application/features/anibla/presentation/bloc/calendar/calendar_event.dart';
import 'package:application/features/anibla/presentation/bloc/calendar/calendar_state.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final PremieresRepository repository;
  CalendarBloc(this.repository) : super(CalendarLoading()) {
    on<GetCalendar>(onGetCalendar);
    on<GetCalendarWeekly>(onGetWeekly);
  }
  void onGetCalendar(GetCalendar event, Emitter<CalendarState> emit) async {
    emit(CalendarLoading());
    final either = await repository.getPremieres(event.date);
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
    List<Premieres?> calendars = [];

    for (DateTime day in days) {
      final either = await repository.getPremieres(day);
      calendars.add(
        either.fold(
          (failure) {
            if (failure is NetworkFailure) {
              emit(CalendarError(ExceptionMapper.mapFailureToMessage(failure)));
            }
            return;
          },
          (calendar) {
            final timers = [...calendar.premieres];
            timers.sort((a, b) => a.time.compareTo(b.time));
            return calendar.copyWith(premieres: timers);
          },
        ),
      );
    }
    if (!calendars.every((calendar) => calendar == null)) {
      emit(CalendarWeeklySuccess(calendars));
    }
  }
}
