import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:application/features/anibla/data/models/misc/timer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'calendar.g.dart';
part 'calendar.freezed.dart';

@freezed
@HiveType(typeId: 3)
abstract class Calendar with _$Calendar {
  const factory Calendar({
    @Default(Pagination()) @HiveField(0) final Pagination pagination,
    @Default([]) @HiveField(1) final List<Timer> timers,
    @Default("") @HiveField(2) final String date,
  }) = _Calendar;

  factory Calendar.fromJson(Map<String, dynamic> json) => _$CalendarFromJson(json);
}
