import 'package:application/features/slider/data/source/remote/slider_api.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SliderRepositoryImpl implements SliderRepository {
  final SliderApi _apiService;
  SliderRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<SliderEntity>>> getSlider() async {
    try {
      final httpResponse = await _apiService.getCarousel();
      return Right(httpResponse.data.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
