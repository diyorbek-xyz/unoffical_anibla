import 'dart:io';

import 'package:application/core/resources/data_state.dart';
import 'package:application/core/resources/dio_exception.dart';
import 'package:application/data/sources/remote/category_api_service.dart';
import 'package:application/domain/entities/filter/category_entity.dart';
import 'package:application/domain/repositories/category_repository.dart';
import 'package:dio/dio.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiService _categoryApiService;
  const CategoryRepositoryImpl(this._categoryApiService);

  @override
  Future<DataState<List<CategoryEntity>>> getCategoriesList() async {
    try {
      final httpResponse = await _categoryApiService.getCategoriesList();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
      } else {
        return DataFailed(DataException(httpResponse.response).scream(), httpResponse.response);
      }
    } on DioException catch (e) {
      return DataFailed(e, e.response);
    }
  }
}
