import 'package:application/features/profile/data/models/profile/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.g.dart';
part 'comment_model.freezed.dart';

@Freezed(fromJson: true, toJson: true)
sealed class CommentModel with _$CommentModel {
  factory CommentModel({
    @JsonKey(name: "_id") final String? id,
    @JsonKey(name: "is_active") final bool? isActive,
    final int? likesCount,
    final String? message,
    final int? isCurrentUser,
    @JsonKey(name: "replies_count") final int? repliesCount,
    final DateTime? createdAt,
    final ProfileModel? user,
    @JsonKey(name: "user_id") final ProfileModel? userId,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
