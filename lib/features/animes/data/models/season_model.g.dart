// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => SeasonModel(
  id: json['_id'] as String?,
  ru: json['ru'],
  slug: json['slug'] as String?,
  uz: json['uz'],
);

Map<String, dynamic> _$SeasonModelToJson(SeasonModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uz': instance.uz,
      'ru': instance.ru,
      'slug': instance.slug,
    };
