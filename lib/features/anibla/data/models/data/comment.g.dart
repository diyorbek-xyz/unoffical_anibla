// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Comment _$CommentFromJson(Map<String, dynamic> json) => _Comment(
  id: json['_id'] as String? ?? "",
  isActive: json['is_active'] as bool? ?? false,
  likesCount: (json['likesCount'] as num?)?.toInt() ?? 0,
  message: json['message'] as String? ?? "",
  isCurrentUser: (json['isCurrentUser'] as num?)?.toInt() ?? 0,
  repliesCount: (json['replies_count'] as num?)?.toInt() ?? 0,
  createdAt: json['createdAt'] as String? ?? "",
  user: json['user'] == null ? const Profile() : Profile.fromJson(json['user']),
  userId: json['user_id'] == null
      ? const Profile()
      : Profile.fromJson(json['user_id']),
);

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
  '_id': instance.id,
  'is_active': instance.isActive,
  'likesCount': instance.likesCount,
  'message': instance.message,
  'isCurrentUser': instance.isCurrentUser,
  'replies_count': instance.repliesCount,
  'createdAt': instance.createdAt,
  'user': instance.user,
  'user_id': instance.userId,
};
