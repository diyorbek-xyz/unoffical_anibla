import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final int phoneNumber;
  final String image;
  final bool activated;
  final double balance;
  final String role;
  final dynamic subscription;
  final List transactions;
  const AccountEntity({
    required this.activated,
    required this.balance,
    required this.email,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.image,
    required this.subscription,
    required this.transactions,
  });

  @override
  List<Object?> get props => [id, email, name, phoneNumber, image, activated, balance, role, subscription, transactions];
}
