// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesReponse _$CategoriesReponseFromJson(Map<String, dynamic> json) =>
    _CategoriesReponse(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? const Pagination()
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesReponseToJson(_CategoriesReponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'pagination': instance.pagination,
    };
