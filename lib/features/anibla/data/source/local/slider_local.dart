import 'package:application/features/anibla/data/models/data/carousel_item.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class SliderLocal {
  Future<List<CarouselItem>?> getSlider();
  Future<void> saveSlider(List<CarouselItem> slider);
  Future<void> clearSlider();
}

class SliderLocalImpl implements SliderLocal {
  final Box<CarouselItem> box;
  const SliderLocalImpl(this.box);

  @override
  Future<void> saveSlider(List<CarouselItem> slider) async {
    await box.putAll(slider.asMap());
  }

  @override
  Future<List<CarouselItem>?> getSlider() async {
    return box.values.toList();
  }

  @override
  Future<void> clearSlider() async {
    await box.clear();
  }
}
