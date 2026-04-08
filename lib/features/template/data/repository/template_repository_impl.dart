import 'package:application/features/template/data/source/remote/template_api.dart';
import 'package:application/features/template/domain/entities/template_entity.dart';
import 'package:application/features/template/domain/repository/template_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateApi _apiService;
  TemplateRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, TemplateEntity>> getTemplate() async {
    try {
      final httpResponse = await _apiService.getTemplate();
      return Right(httpResponse.data.data.toEntity());
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getTest() async {
    try {
      final httpResponse = await _apiService.getTest();
      return Right(httpResponse.data.data.toEntity());
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
