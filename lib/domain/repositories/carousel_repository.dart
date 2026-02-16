import 'package:application/core/resources/data_state.dart';
import 'package:application/domain/entities/other/carousel_entity.dart';

abstract class CarouselRepository {
  Future<DataState<List<CarouselItemEntity>>> getCarouselItemList();
}
