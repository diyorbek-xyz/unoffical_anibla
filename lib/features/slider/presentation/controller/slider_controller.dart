import 'package:application/core/utils/extensions.dart';
import 'package:application/features/slider/data/mapper/slider_mapper.dart';
import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:signals_flutter/signals_core.dart';

class SliderController {
  final SliderRepository _sliderRepository;
  SliderController(this._sliderRepository);

  final fakeSlider = List.generate(4, (index) => SliderMapper.modelToEntity(null));
  late final sliderSignal = futureSignal(() async {
    final either = await _sliderRepository.getSlider();
    return either.getData();
  });

  void refresh() => sliderSignal.refresh();
}
