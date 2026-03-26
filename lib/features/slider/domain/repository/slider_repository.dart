import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SliderRepository {
  Future<Either<Failure, List<SliderEntity>>> getSlider();
}
