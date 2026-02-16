import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/core/resources/dio_exception.dart';
import 'package:application/data/sources/remote/carousel_api_service.dart';
import 'package:application/domain/entities/other/carousel_entity.dart';
import 'package:application/domain/repositories/carousel_repository.dart';
import 'package:dio/dio.dart';

class CarouselRepositoryImpl implements CarouselRepository {
  final CarouselApiService _carouselApiService;
  const CarouselRepositoryImpl(this._carouselApiService);

  @override
  Future<DataState<List<CarouselItemEntity>>> getCarouselItemList() async {
    try {
      final httpResponse = await _carouselApiService.getCarousel();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.getEntityList());
      } else {
        return DataFailed(DataException(httpResponse.response).scream());
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
