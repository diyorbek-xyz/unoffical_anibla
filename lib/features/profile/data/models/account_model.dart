import 'package:application/features/profile/domain/entities/account_entity.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class AccountModel {
  @HiveField(0)
  @JsonKey(name: "_id")
  final String? id;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  @JsonKey(name: "phone_number")
  final int? phoneNumber;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final bool? activated;
  @HiveField(6)
  final double? balance;
  @HiveField(7)
  final String? role;
  @HiveField(8)
  final dynamic subscription;
  @HiveField(9)
  final List? transactions;
  const AccountModel({
    this.activated,
    this.balance,
    this.email,
    this.id,
    this.name,
    this.phoneNumber,
    this.role,
    this.image,
    this.subscription,
    this.transactions,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
  AccountEntity toEntity() => AccountEntity(
    activated: activated ?? false,
    balance: balance ?? 0,
    email: email ?? "",
    id: id ?? "?",
    name: name ?? "nomalum",
    phoneNumber: phoneNumber ?? 0,
    role: role ?? "USER",
    image: image ?? "",
    subscription: subscription,
    transactions: transactions ?? [],
  );
}
