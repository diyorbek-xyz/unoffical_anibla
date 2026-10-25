import 'package:application/features/anibla/data/models/data/category.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response.g.dart';
part 'categories_response.freezed.dart';

@freezed
abstract class CategoriesReponse with _$CategoriesReponse {
  const factory CategoriesReponse({@Default([]) List<Category> categories, @Default(Pagination()) Pagination pagination}) = _CategoriesReponse;
  factory CategoriesReponse.fromJson(Map<String, dynamic> json) => _$CategoriesReponseFromJson(json);
}
