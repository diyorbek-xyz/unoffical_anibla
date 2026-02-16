import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/data/models/param_models/calendar_params.dart';
import 'package:application/domain/entities/other/calendar_entity.dart';
import 'package:application/domain/repositories/calendar_repository.dart';

class GetCalendarUsecase implements UseCase<DataState<CalendarEntity>, GetCalendarParams> {
  CalendarRepository repository;
  GetCalendarUsecase(this.repository);

  @override
  Future<DataState<CalendarEntity>> call(GetCalendarParams params) {
    return repository.getCalendar(params);
  }
}
