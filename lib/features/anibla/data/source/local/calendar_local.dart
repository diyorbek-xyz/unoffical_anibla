import 'package:application/core/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/calendar.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class CalendarLocal {
  Future<void> saveCalendar(Calendar calendar);
  Future<Calendar?> getCalendar(DateTime date);
  Future<List<Calendar>> getFullCalendar();
}

class CalendarLocalImpl implements CalendarLocal {
  final Box<Calendar> box;
  CalendarLocalImpl(this.box);

  @override
  Future<void> saveCalendar(Calendar calendar) async {
    await box.put(DateTime.tryParse(calendar.date)?.formatCompact() ?? "date", calendar);
  }

  @override
  Future<Calendar?> getCalendar(DateTime date) async {
    return box.get(date.formatCompact());
  }

  @override
  Future<List<Calendar>> getFullCalendar() async {
    return box.values.toList();
  }
}
