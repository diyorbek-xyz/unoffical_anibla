import 'package:application/domain/entities/auth/account_entity.dart';

class AccountResponseModel {
  final AccountModel user;
  final String accesToken;
  final String refreshToken;
  const AccountResponseModel({required this.accesToken, required this.refreshToken, required this.user});
  factory AccountResponseModel.fromJson(dynamic json) {
    return AccountResponseModel(
      accesToken: json['token']['accessToken'],
      refreshToken: json['token']['refreshToken'],
      user: AccountModel.fromJson(json['user']),
    );
  }
}

class AccountModel extends AccountEntity {
  const AccountModel({
    required super.active,
    required super.avatar,
    required super.balance,
    required super.email,
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.role,
    required super.subscription,
    required super.transactions,
  });

  factory AccountModel.fromJson(dynamic json) {
    return AccountModel(
      id: json['_id'],
      name: json['name'],
      avatar: json['image'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      balance: json['balance'],
      active: json['activated'],
      role: AccountRole.fromString(json['role']),
      subscription: json['subscription'],
      transactions: json['transactions'],
    );
  }
}

enum AccountRole {
  user("user"),
  admin("admin");

  final String str;
  const AccountRole(this.str);

  static AccountRole fromString(String str) {
    return values.firstWhere((e) => e.str.toLowerCase() == str.toLowerCase(), orElse: () => user);
  }
}
