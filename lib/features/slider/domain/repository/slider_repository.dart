import 'package:application/core/resources/data_state.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';

abstract class SliderRepository {
  Future<DataState<List<SliderEntity>>> getSlider();
}
