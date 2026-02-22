import 'package:application/core/resources/response_model.dart';
import 'package:application/data/models/common/miscs_model.dart';
import 'package:application/data/models/filter/category_model.dart';

class CategoryResponseModel extends ResponseModel<List<CategoryModel>> {
  final PaginationModel pagination;
  const CategoryResponseModel({required super.data, required this.pagination, required super.message, required super.success});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      data: json['data'] != null && json['data']['categories'] != null
          ? (json['data']['categories'] as List<dynamic>).map((e) => CategoryModel.fromJson(e)).toList()
          : [],
      pagination: json['data'] != null
          ? PaginationModel.fromJson(json['data']['pagination'] as Map<String, dynamic>)
          : PaginationModel.empty(),
      message: json['message'] as String,
      success: json['success'] as bool,
    );
  }
}
