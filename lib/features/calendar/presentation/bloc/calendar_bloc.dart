import 'package:application/core/resources/data_state.dart';
import 'package:application/features/calendar/domain/repository/calendar_repository.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_event.dart';
import 'package:application/features/calendar/presentation/bloc/calendar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarRepository repository;
  CalendarBloc(this.repository) : super(CalendarLoading()) {
    on<GetCalendar>(onGetCalendar);
  }
  void onGetCalendar(GetCalendar event, Emitter<CalendarState> emit) async {
    emit(CalendarLoading());
    final dataState = await repository.getCalendar(event.date);
    if (dataState is DataSuccess) {
      emit(CalendarSuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(CalendarError(dataState.exception!, dataState.response));
    }
  }
}
