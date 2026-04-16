import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String name;
  final String image;
  final String role;
  final bool status;
  const ItemEntity({
    required this.image,
    required this.name,
    required this.role,
    required this.status,
  });

  @override
  List<Object?> get props => [image, name, role, status];
}
