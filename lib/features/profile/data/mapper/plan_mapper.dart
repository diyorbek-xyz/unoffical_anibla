import 'package:application/features/common/mapper/translated_mapper.dart';
import 'package:application/features/profile/data/models/plan_model.dart';
import 'package:application/features/profile/domain/entities/plan_entity.dart';

class PlanMapper {
  static PlanEntity modelToEntity(PlanModel? model) =>
      PlanEntity(price: model?.price ?? 0, time: model?.time ?? 0, title: TranslatedMapper.modelToEntity(model?.title));
}
