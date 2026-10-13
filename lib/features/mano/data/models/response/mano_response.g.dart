// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoResponse<T> _$ManoResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ManoResponse<T>(
  data: fromJsonT(json['data']),
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  offset: (json['offset'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ManoResponseToJson<T>(
  _ManoResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'limit': instance.limit,
  'offset': instance.offset,
  'total': instance.total,
};
