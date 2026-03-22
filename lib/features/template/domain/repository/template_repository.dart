import 'package:application/core/resources/data_state.dart';
import 'package:application/features/template/domain/entities/template_entity.dart';

abstract class TemplateRepository {
  Future<DataState<TemplateEntity>> getTemplate();
}
