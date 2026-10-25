import 'package:application/features/anibla/data/models/helper/localized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@freezed
@HiveType(typeId: 6783)
abstract class Category with _$Category {
  const factory Category({
    @HiveField(0) @Default("") @JsonKey(name: '_id') String id,
    @HiveField(1) @Default(Localized()) Localized name,
    @HiveField(2) @Default("") String slug,
    @HiveField(3) @Default(false) bool status,
    @HiveField(4) @Default(0) @JsonKey(name: 'anime_count') int animeCount,
  }) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
