import 'package:application/features/calendar/data/models/timer_model.dart';
import 'package:application/features/common/data/models/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'calendar_model.g.dart';
part 'calendar_model.freezed.dart';

@HiveType(typeId: 3)
@freezed
sealed class CalendarModel with _$CalendarModel {
  factory CalendarModel({
    @HiveField(0) final Pagination? pagination,
    @HiveField(1) final List<TimerModel>? timers,
    @HiveField(2) final DateTime? date,
  }) = _CalendarModel;

  factory CalendarModel.fromJson(Map<String, dynamic> json) => _$CalendarModelFromJson(json);
}
