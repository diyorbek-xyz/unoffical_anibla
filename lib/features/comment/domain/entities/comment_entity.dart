import 'package:application/features/profile/domain/entities/profile_entity.dart';
import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String id;
  final String message;
  final String repliedId;
  final bool isActive;
  final int likesCount;
  final int isCurrentUser;
  final int repliesCount;
  final ProfileEntity user;
  final DateTime createdAt;
  const CommentEntity({
    required this.id,
    required this.isActive,
    required this.isCurrentUser,
    required this.likesCount,
    required this.message,
    required this.repliedId,
    required this.repliesCount,
    required this.user,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
    id,
    isActive,
    isCurrentUser,
    likesCount,
    message,
    repliedId,
    repliesCount,
    user,
    createdAt
  ];
}
