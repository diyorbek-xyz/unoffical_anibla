import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/data/slider.dart';
import 'package:application/features/anibla/domain/repositories/slider_repository.dart';
import 'package:signals_flutter/signals_core.dart';

class SliderController {
  final SliderRepository _sliderRepository;
  SliderController(this._sliderRepository);

  final fakeSlider = List.generate(4, (index) => Slider(anime: .new(uz: {"description": lorem(300)})));
  late final sliderSignal = futureSignal(() async {
    final either = await _sliderRepository.getSlider();
    return either.getData();
  });

  void refresh() => sliderSignal.refresh();
}
