import 'package:application/core/utils/utils.dart';
import 'package:application/data/models/enums/user_role.dart';
import 'package:application/domain/entities/users/account_entity.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 30)
class UserModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final UserRole? role;
  @HiveField(2)
  final String? status;
  @HiveField(3)
  final double? balance;
  @HiveField(4)
  final String? name;
  @HiveField(5)
  final String? phone;
  @HiveField(6)
  final String? avatar;

  const UserModel({this.id, this.avatar, this.balance, this.name, this.phone, this.role, this.status});
  factory UserModel.fromJson(dynamic json) {
    if (json is String) {
      return UserModel(id: json, avatar: "?", balance: 0.0, name: "?", phone: "?", role: UserRole.user, status: "?");
    }
    if (json is Map) {
      return UserModel(
        id: json['_id'],
        avatar: addBaseUrl(json['photo']),
        balance: double.parse(json['balance'].toString()),
        name: json['name'],
        phone: json['phone'],
        role: UserRole.fromString(json['role']),
        status: json['status'],
      );
    }
    throw Exception("Invalid json format: $json");
  }
  Map<String, dynamic> toJson() {
    return {"_id": id, "photo": avatar, "balance": balance, "name": name, "phone": phone, "role": role, "status": status};
  }
}

@HiveType(typeId: 31)
class AccountModel extends AccountEntity {
  @HiveField(0)
  @override
  String? get id => super.id;

  @HiveField(1)
  @override
  String? get name => super.name;

  @HiveField(2)
  @override
  String? get image => super.image;

  @HiveField(3)
  @override
  bool? get status => super.status;

  @HiveField(4)
  @override
  UserRole? get role => super.role;

  const AccountModel({super.id, super.image, super.name, super.role, super.status});

  factory AccountModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return AccountModel(
        id: json['_id'],
        image: json['image'],
        name: json['name'],
        role: UserRole.fromString(json['role']),
        status: json['status'],
      );
    }
    if (json is String) {
      return AccountModel(id: json);
    }
    throw Exception("Invalid json format: $json");
  }
}
