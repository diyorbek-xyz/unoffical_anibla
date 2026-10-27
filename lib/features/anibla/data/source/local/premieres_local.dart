import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/premieres.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class PremieresLocal {
  Future<void> savePremieres(Premieres calendar);
  Future<Premieres?> getPremieres(DateTime date);
  Future<List<Premieres>> getFullPremieres();
}

class PremieresLocalImpl implements PremieresLocal {
  final Box<Premieres> box;
  PremieresLocalImpl(this.box);

  @override
  Future<void> savePremieres(Premieres calendar) async {
    await box.put(DateTime.tryParse(calendar.date)?.formatCompact() ?? "date", calendar);
  }

  @override
  Future<Premieres?> getPremieres(DateTime date) async {
    return box.get(date.formatCompact());
  }

  @override
  Future<List<Premieres>> getFullPremieres() async {
    return box.values.toList();
  }
}
