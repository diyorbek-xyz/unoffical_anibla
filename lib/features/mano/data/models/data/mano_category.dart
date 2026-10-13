import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'mano_category.g.dart';
part 'mano_category.freezed.dart';

@freezed
@HiveType(typeId: 5322)
abstract class ManoCategory with _$ManoCategory {
  const factory ManoCategory({
    @HiveField(0) @Default("") @JsonKey(name: "category_id") String id,
    @HiveField(1) @Default("") @JsonKey(name: "name") String title,
  }) = _ManoCategory;
  factory ManoCategory.fromJson(Map<String, dynamic> json) => _$ManoCategoryFromJson(json);
}
