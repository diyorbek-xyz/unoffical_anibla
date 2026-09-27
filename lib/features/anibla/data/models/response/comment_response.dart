import 'package:application/features/anibla/data/models/data/comment.dart';
import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_response.g.dart';
part 'comment_response.freezed.dart';

@freezed
abstract class CommentResponse with _$CommentResponse {
  const factory CommentResponse({@Default([]) List<Comment> comments, @Default(Pagination()) Pagination pagination}) =
      _CommentResponse;
  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);
}
