import 'package:application/features/profile/data/models/profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  @JsonKey(name: "_id")
  final String? id;
  final String? message;
  @JsonKey(name: "replied_id")
  final String? repliedId;
  @JsonKey(name: "is_active")
  final bool? isActive;
  final int? likesCount;
  final int? isCurrentUser;
  @JsonKey(name: "replies_count")
  final int? repliesCount;
  final DateTime? createdAt;
  final ProfileModel? user;
  const CommentModel({
    this.id,
    this.isActive,
    this.isCurrentUser,
    this.likesCount,
    this.message,
    this.repliedId,
    this.repliesCount,
    this.user,
    this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
