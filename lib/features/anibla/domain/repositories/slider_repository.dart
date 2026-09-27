import 'package:application/features/anibla/data/models/data/slider.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SliderRepository {
  Future<Either<Failure, List<Slider>>> getSlider();
}
