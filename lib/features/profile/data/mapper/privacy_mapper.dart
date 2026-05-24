import 'package:application/features/profile/data/models/privacy_model.dart';
import 'package:application/features/profile/domain/entities/privacy_entity.dart';

class PrivacyMapper {
  static PrivacyEntity modelToEntity(PrivacyModel? model) =>
      PrivacyEntity(id: model?.id ?? "", showComments: model?.showComments ?? false, showFavorites: model?.showFavorites ?? false);
}
