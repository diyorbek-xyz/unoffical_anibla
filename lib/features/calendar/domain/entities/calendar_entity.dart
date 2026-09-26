import 'package:application/features/anibla/data/models/misc/timer.dart';
import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:equatable/equatable.dart';

class CalendarEntity extends Equatable {
  final List<Timer> timers;
  final Pagination pagination;
  final DateTime date;
  const CalendarEntity({required this.timers, required this.pagination, required this.date});

  @override
  List<Object?> get props => [timers, pagination];
}
