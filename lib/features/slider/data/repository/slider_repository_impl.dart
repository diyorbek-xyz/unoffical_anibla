import 'package:application/features/slider/data/mapper/slider_mapper.dart';
import 'package:application/features/slider/data/source/local/slider_local.dart';
import 'package:application/features/slider/data/source/remote/slider_api.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SliderRepositoryImpl implements SliderRepository {
  final SliderApi _apiService;
  final SliderLocal _localService;
  SliderRepositoryImpl(this._apiService, this._localService);

  @override
  Future<Either<Failure, List<SliderEntity>>> getSlider() async {
    try {
      try {
        final httpResponse = await _apiService.getCarousel();
        await _localService.saveSlider(httpResponse.data.data);
        return Right(
          httpResponse.data.data.map(SliderMapper.modelToEntity).toList(),
        );
      } on DioException catch (e) {
        if (ExceptionMapper.mapDioToFailure(e) is! NetworkFailure) rethrow;
        final slider = await _localService.getSlider();
        if (slider == null) rethrow;
        return Right(slider.map(SliderMapper.modelToEntity).toList());
      }
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
