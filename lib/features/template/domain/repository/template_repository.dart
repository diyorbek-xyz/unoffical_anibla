import 'package:application/features/template/domain/entities/template_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemplate();
  Future<Either<Failure, dynamic>> getTest();
}
