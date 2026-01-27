import 'package:application/models/anime.dart';

class User {
  final String id;
  final String role;
  final String status;
  final double balance;
  final String name;
  final String phone;
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
}
