import 'package:application/features/anibla/data/models/misc/premieres.dart';
import 'package:application/features/anibla/domain/repositories/premieres_repository.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_core.dart';

class TimerController {
  final PremieresRepository _premieresRepository;
  TimerController(this._premieresRepository);

  late final timerContainer = futureSignalContainer<Premieres, DateTime>(
    (date) => futureSignal(() async {
      final either = await _premieresRepository.getPremieres(date);
      return either.getData();
    }),
  );
}
