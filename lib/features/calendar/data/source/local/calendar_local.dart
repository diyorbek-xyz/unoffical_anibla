import 'package:application/core/utils/extensions.dart';
import 'package:application/features/calendar/data/models/calendar_model.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class CalendarLocal {
  Future<void> saveCalendar(CalendarModel calendar);
  Future<CalendarModel?> getCalendar(DateTime date);
  Future<List<CalendarModel>> getFullCalendar();
}

class CalendarLocalImpl implements CalendarLocal {
  final Box<CalendarModel> box;
  CalendarLocalImpl(this.box);

  @override
  Future<void> saveCalendar(CalendarModel calendar) async {
    await box.put(calendar.date?.formatCompact(), calendar);
  }

  @override
  Future<CalendarModel?> getCalendar(DateTime date) async {
    return box.get(date.formatCompact());
  }

  @override
  Future<List<CalendarModel>> getFullCalendar() async {
    return box.values.toList();
  }
}
