import 'package:application/features/anibla/data/models/data/carousel_item.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SliderRepository {
  Future<Either<Failure, List<CarouselItem>>> getSlider();
}
