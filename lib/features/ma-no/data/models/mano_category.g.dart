// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mano_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManoCategory _$ManoCategoryFromJson(Map<String, dynamic> json) =>
    _ManoCategory(
      id: json['category_id'] as String? ?? "",
      title: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$ManoCategoryToJson(_ManoCategory instance) =>
    <String, dynamic>{'category_id': instance.id, 'name': instance.title};
