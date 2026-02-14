import 'package:application/data/models/enums/user_role.dart';
import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String? id;
  final String? name;
  final String? image;
  final bool? status;
  final UserRole? role;

  const AccountEntity({this.id, this.image, this.name, this.role, this.status});
  @override
  List<Object?> get props => [id, name, image, status, role];
}
