// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Plan _$PlanFromJson(Map<String, dynamic> json) => _Plan(
  title: json['name'] == null
      ? const Localized()
      : Localized.fromJson(json['name'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt() ?? 0,
  time: (json['time'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PlanToJson(_Plan instance) => <String, dynamic>{
  'name': instance.title,
  'price': instance.price,
  'time': instance.time,
};
