import 'package:application/miscs/utils.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 5)
class User {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String role;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final double balance;
  @HiveField(4)
  final String name;
  @HiveField(5)
  final String phone;
  @HiveField(6)
  final String avatar;

  const User({
    required this.id,
    required this.avatar,
    required this.balance,
    required this.name,
    required this.phone,
    required this.role,
    required this.status,
  });
  factory User.fromJson(dynamic json) {
    if (json is String) return User(id: json, avatar: "?", balance: 0.0, name: "?", phone: "?", role: "?", status: "?");
    if (json is Map) {
      return User(
        id: json['_id'],
        avatar: addBaseUrl(json['photo']),
        balance: double.parse(json['balance'].toString()),
        name: json['name'],
        phone: json['phone'],
        role: json['role'],
        status: json['status'],
      );
    }
    return User(id: "?", avatar: "?", balance: 0.0, name: "?", phone: "?", role: "?", status: "?");
  }
  Map<String, dynamic> toJson() {
    return {"_id": id, "photo": avatar, "balance": balance, "name": name, "phone": phone, "role": role, "status": status};
  }
}
