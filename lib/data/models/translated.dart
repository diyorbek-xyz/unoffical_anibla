import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'translated.g.dart';

@HiveType(typeId: 0)
class Translated {
  @HiveField(0)
  final String uz;

  @HiveField(1)
  final String rus;
  const Translated({required this.rus, required this.uz});

  factory Translated.fromJson(dynamic json) {
    if (json is String) return Translated(rus: json, uz: json);
    if (json is Map) return Translated(rus: json['ru'] ?? "?", uz: json['uz'] ?? "?");
    return Translated(rus: "?", uz: "?");
  }
  Map<String, dynamic> toJson() => {'uz': uz, 'ru': rus};
}
