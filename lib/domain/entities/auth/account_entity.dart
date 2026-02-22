import 'package:application/data/models/auth/account.dart';
import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String? email;
  final String name;
  final String? phoneNumber;
  final String avatar;
  final bool active;
  final int balance;
  final AccountRole role;
  final String? subscription;
  final List transactions;
  const AccountEntity({
    required this.active,
    required this.avatar,
    required this.balance,
    required this.email,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.subscription,
    required this.transactions,
  });

  @override
  List<Object?> get props => [active, avatar, balance, email, id, name, phoneNumber, role, subscription, transactions];
}
