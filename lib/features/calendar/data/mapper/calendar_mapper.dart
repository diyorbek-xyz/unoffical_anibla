import 'package:application/features/calendar/data/mapper/timer_mapper.dart';
import 'package:application/features/calendar/data/models/calendar_model.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:application/features/common/data/models/helpers/pagination.dart';

class CalendarMapper {
  static CalendarEntity modelToEntity(CalendarModel? model) => CalendarEntity(
    timers: model?.timers?.map(TimerMapper.modelToEntity).toList() ?? [],
    pagination: model?.pagination ?? Pagination(),
    date: model?.date ?? DateTime(2026),
  );
}
