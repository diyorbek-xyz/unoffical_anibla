import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/param_models/calendar_params.dart';
import 'package:application/domain/usecases/calendar_usecase.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_event.dart';
import 'package:application/presentation/bloc/calendar/remote/remote_calendar_state.dart';
import 'package:application/presentation/model/calendar_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCalendarBloc extends Bloc<RemoteCalendarEvent, RemoteCalendarState> {
  final GetCalendarUsecase _getCalendarUsecase;
  RemoteCalendarBloc(this._getCalendarUsecase) : super(RemoteCalendarLoading()) {
    on<GetCalendar>(onGetCalendar);
  }

  void onGetCalendar(GetCalendar event, Emitter<RemoteCalendarState> emit) async {
    try {
      emit(RemoteCalendarLoading());
      List<CalendarUiModel> list = [];
      for (var date in event.params) {
        final dataState = await _getCalendarUsecase(GetCalendarParams(date));
        if (dataState is DataSuccess) {
          final uidata = CalendarUiModel.fromEntity(dataState.data!);
          list.add(uidata);
        }
        if (dataState is DataFailed) {
          throw dataState.exception!;
        }
      }
      emit(RemoteCalendarDone(list));
    } on DioException catch (e) {
      emit(RemoteCalendarFailed(e));
    }
  }
}
