import 'package:application/features/common/data/models/miscs/item_model.dart';
import 'package:application/features/common/domain/entities/item_entity.dart';

class ItemMapper {
  static ItemEntity modelToEntity(ItemModel model) => ItemEntity(
    image: model.image ?? "",
    name: model.name ?? "",
    role: model.role ?? "",
    status: model.status ?? false,
  );
  static ItemModel entityToModel(ItemEntity entity) =>
      ItemModel(image: entity.image, name: entity.name, role: entity.role, status: entity.status);
}
