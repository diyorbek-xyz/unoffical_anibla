// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'big_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BigResponse<T> _$BigResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _BigResponse<T>(
  datas: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? "",
  pagination: json['pagination'] == null
      ? const Pagination()
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  error: json['error'] ?? "",
);

Map<String, dynamic> _$BigResponseToJson<T>(
  _BigResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.datas.map(toJsonT).toList(),
  'success': instance.success,
  'message': instance.message,
  'pagination': instance.pagination,
  'error': instance.error,
};
