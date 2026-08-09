// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedModel _$SavedModelFromJson(Map<String, dynamic> json) => _SavedModel(
  id: json['_id'] as String?,
  userId: json['user_id'] as String?,
  anime: json['media'] == null ? null : AnimeModel.fromJson(json['media']),
  lastVisitedAt: json['last_visited'] == null
      ? null
      : DateTime.parse(json['last_visited'] as String),
);

Map<String, dynamic> _$SavedModelToJson(_SavedModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'media': instance.anime,
      'last_visited': instance.lastVisitedAt?.toIso8601String(),
    };
