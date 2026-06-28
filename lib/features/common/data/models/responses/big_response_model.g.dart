// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'big_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BigResponseModel<T> _$BigResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BigResponseModel<T>(
  datas: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  error: json['error'],
  message: json['message'] as String?,
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  success: json['success'] as bool?,
);

Map<String, dynamic> _$BigResponseModelToJson<T>(
  BigResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.datas?.map(toJsonT).toList(),
  'success': instance.success,
  'message': instance.message,
  'pagination': instance.pagination,
  'error': instance.error,
};
