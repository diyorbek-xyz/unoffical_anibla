// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
  id: json['_id'] as String?,
  isActive: json['is_active'] as bool?,
  isCurrentUser: (json['isCurrentUser'] as num?)?.toInt(),
  likesCount: (json['likesCount'] as num?)?.toInt(),
  message: json['message'] as String?,
  repliedId: json['replied_id'] as String?,
  repliesCount: (json['replies_count'] as num?)?.toInt(),
  user: json['user'] == null
      ? null
      : ProfileModel.fromJson(json['user'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'replied_id': instance.repliedId,
      'is_active': instance.isActive,
      'likesCount': instance.likesCount,
      'isCurrentUser': instance.isCurrentUser,
      'replies_count': instance.repliesCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
    };
