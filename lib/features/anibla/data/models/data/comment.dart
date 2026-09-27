import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.g.dart';
part 'comment.freezed.dart';

@Freezed(fromJson: true, toJson: true)
sealed class Comment with _$Comment {
  const factory Comment({
    @Default("") @JsonKey(name: "_id") String id,
    @Default(false) @JsonKey(name: "is_active") bool isActive,
    @Default(0) int likesCount,
    @Default("") String message,
    @Default(0) int isCurrentUser,
    @Default(0) @JsonKey(name: "replies_count") int repliesCount,
    @Default("") String createdAt,
    @Default(Profile()) Profile user,
    @Default(Profile()) @JsonKey(name: "user_id") Profile userId,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
