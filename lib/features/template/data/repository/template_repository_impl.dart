import 'dart:io';
import 'package:application/core/resources/data_state.dart';
import 'package:application/features/template/data/source/remote/template_api.dart';
import 'package:application/features/template/domain/entities/template_entity.dart';
import 'package:application/features/template/domain/repository/template_repository.dart';
import 'package:dio/dio.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateApi _apiService;
  TemplateRepositoryImpl(this._apiService);

  @override
  Future<DataState<TemplateEntity>> getTemplate() async {
    try {
      final httpResponse = await _apiService.getTemplate();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data.toEntity());
      } else {
        return DataFailed(DioException(requestOptions: httpResponse.response.requestOptions), httpResponse.response);
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
