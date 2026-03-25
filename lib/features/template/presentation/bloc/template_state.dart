import 'package:application/features/template/domain/entities/template_entity.dart';
import 'package:dio/dio.dart';

sealed class TemplateState {}

final class TemplateInitial extends TemplateState {}

final class TemplateLoading extends TemplateState {}

final class TemplateSuccess extends TemplateState {
  final TemplateEntity data;
  TemplateSuccess(this.data);
}

final class TemplateError extends TemplateState {
  final DioException exception;
  TemplateError(this.exception);
}
