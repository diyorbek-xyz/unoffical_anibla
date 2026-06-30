// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: json['_id'] as String?,
      isActive: json['is_active'] as bool?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      message: json['message'] as String?,
      isCurrentUser: (json['isCurrentUser'] as num?)?.toInt(),
      repliesCount: (json['replies_count'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      user: json['user'] == null ? null : ProfileModel.fromJson(json['user']),
      userId: json['user_id'] == null
          ? null
          : ProfileModel.fromJson(json['user_id']),
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'is_active': instance.isActive,
      'likesCount': instance.likesCount,
      'message': instance.message,
      'isCurrentUser': instance.isCurrentUser,
      'replies_count': instance.repliesCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'user_id': instance.userId,
    };
