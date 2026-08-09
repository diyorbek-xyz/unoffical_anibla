// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanModel _$PlanModelFromJson(Map<String, dynamic> json) => _PlanModel(
  title: json['name'] == null
      ? null
      : TranslatedModel.fromJson(json['name'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt(),
  time: (json['time'] as num?)?.toInt(),
);

Map<String, dynamic> _$PlanModelToJson(_PlanModel instance) =>
    <String, dynamic>{
      'name': instance.title,
      'price': instance.price,
      'time': instance.time,
    };
