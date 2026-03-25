import 'package:application/features/calendar/domain/repository/calendar_repository.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_event.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_state.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarRepository repository;
  CalendarBloc(this.repository) : super(CalendarLoading()) {
    on<GetCalendar>(onGetCalendar);
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
}
