import 'package:application/features/anibla/data/models/data/slider.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class SliderLocal {
  Future<List<Slider>?> getSlider();
  Future<void> saveSlider(List<Slider> slider);
  Future<void> clearSlider();
}

class SliderLocalImpl implements SliderLocal {
  final Box<Slider> box;
  const SliderLocalImpl(this.box);

  @override
  Future<void> saveSlider(List<Slider> slider) async {
    await box.putAll(slider.asMap());
  }

  @override
  Future<List<Slider>?> getSlider() async {
    return box.values.toList();
  }

  @override
  Future<void> clearSlider() async {
    await box.clear();
  }
}
