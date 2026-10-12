import 'package:freezed_annotation/freezed_annotation.dart';

part 'mano_category.g.dart';
part 'mano_category.freezed.dart';

@freezed
abstract class ManoCategory with _$ManoCategory {
  const factory ManoCategory({
    @Default("") @JsonKey(name: "category_id") String id,
    @Default("") @JsonKey(name: "name") String title,
  }) = _ManoCategory;
  factory ManoCategory.fromJson(Map<String, dynamic> json) => _$ManoCategoryFromJson(json);
}
