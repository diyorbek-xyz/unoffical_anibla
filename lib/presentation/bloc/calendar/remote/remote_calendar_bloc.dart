import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/usecases/calendar_usecase.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_event.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_state.dart';
import 'package:application/presentation/model/calendar_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCalendarBloc extends Bloc<RemoteCalendarEvent, RemoteCalendarState> {
  final GetCalendarUsecase _getCalendarUsecase;
  RemoteCalendarBloc(this._getCalendarUsecase) : super(RemoteCalendarLoading()) {
    on<GetCalendar>(onGetCalendar);
  }

  void onGetCalendar(GetCalendar event, Emitter<RemoteCalendarState> emit) async {
    emit(RemoteCalendarLoading());
    final dataState = await _getCalendarUsecase(event.params);
    if (dataState is DataSuccess) {
      final uidata = CalendarUiModel.fromEntity(dataState.data!);
      emit(RemoteCalendarDone(uidata));
    }
    if (dataState is DataFailed) {
      emit(RemoteCalendarFailed(dataState.exception!));
    }
  }
}
