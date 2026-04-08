import 'package:application/features/slider/data/models/slider_model.dart';
import 'package:hive_ce/hive_ce.dart';

abstract class SliderLocal {
  Future<List<SliderModel>?> getSlider();
  Future<void> saveSlider(List<SliderModel> slider);
  Future<void> clearSlider();
}

class SliderLocalImpl implements SliderLocal {
  final Box<SliderModel> box;
  const SliderLocalImpl(this.box);

  @override
  Future<void> saveSlider(List<SliderModel> slider) async {
    await box.putAll(slider.asMap());
  }

  @override
  Future<List<SliderModel>?> getSlider() async {
    return box.values.toList();
  }

  @override
  Future<void> clearSlider() async {
    await box.clear();
  }
}
