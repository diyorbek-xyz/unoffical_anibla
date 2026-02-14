import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'anime.g.dart';

@HiveType(typeId: 100)
enum AnimeType {
  @HiveField(0)
  movie("movie"),
  @HiveField(1)
  serie("series");

  final String stringValue;
  const AnimeType(this.stringValue);

  static AnimeType fromString(String str) {
    return values.firstWhere((e) => e.stringValue == str, orElse: () => movie);
  }
}

@HiveType(typeId: 101)
enum AnimePrice {
  @HiveField(0)
  free("free"),
  @HiveField(1)
  paid("paid");

  final String stringValue;
  const AnimePrice(this.stringValue);
  factory AnimePrice.fromString(String str) {
    return values.firstWhere((e) => e.stringValue == str, orElse: () => paid);
  }
}
