import 'package:application/features/calendar/domain/entities/timer_entity.dart';
import 'package:application/features/common/data/models/pagination.dart';
import 'package:equatable/equatable.dart';

class CalendarEntity extends Equatable {
  final List<TimerEntity> timers;
  final Pagination pagination;
  final DateTime date;
  const CalendarEntity({required this.timers, required this.pagination, required this.date});

  @override
  List<Object?> get props => [timers, pagination];
}
