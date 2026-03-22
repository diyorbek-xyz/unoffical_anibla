import 'dart:io';
import 'package:application/core/resources/data_state.dart';
import 'package:application/features/slider/data/source/remote/slider_api.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:application/features/slider/domain/repository/slider_repository.dart';
import 'package:dio/dio.dart';

class SliderRepositoryImpl implements SliderRepository {
  final SliderApi _apiService;
  SliderRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<SliderEntity>>> getSlider() async {
    try {
      final httpResponse = await _apiService.getCarousel();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
      } else {
        return DataFailed(DioException(requestOptions: httpResponse.response.requestOptions), httpResponse.response);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
