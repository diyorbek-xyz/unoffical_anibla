import 'package:application/core/entites/pagination.dart';
import 'package:application/features/calendar/data/models/timer_model.dart';
import 'package:application/features/calendar/domain/entities/calendar_entity.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class CalendarModel {
  @HiveField(0)
  final PaginationModel pagination;

  @HiveField(1)
  final List<TimerModel> timers;

  @HiveField(2)
  final DateTime date;

  const CalendarModel({required this.pagination, required this.timers, required this.date});

  factory CalendarModel.fromJson(Map<String, dynamic> json, DateTime date) {
    Map<String, dynamic> myJson = json;
    myJson['date'] = date.toIso8601String();
    final model = _$CalendarModelFromJson(myJson);
    return CalendarModel(pagination: model.pagination, timers: model.timers, date: date);
  }

  Map<String, dynamic> toJson() => _$CalendarModelToJson(this);

  CalendarEntity toEntity() => CalendarEntity(timers: timers.map((e) => e.toEntity()).toList(), pagination: pagination, date: date);
}
