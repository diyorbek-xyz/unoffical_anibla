import 'package:application/data/models/enums/user_role.dart';
import 'package:application/domain/entities/users/account_entity.dart';

class AccountUiModel {
  final String id;
  final String name;
  final String image;
  final bool status;
  final UserRole role;

  const AccountUiModel({required this.id, required this.image, required this.name, required this.role, required this.status});
  factory AccountUiModel.fromEntity(AccountEntity entity) {
    return AccountUiModel(
      id: entity.id ?? "id",
      image: entity.image ?? 'image',
      name: entity.name ?? "name",
      role: entity.role ?? UserRole.user,
      status: entity.status ?? false,
    );
  }
}
