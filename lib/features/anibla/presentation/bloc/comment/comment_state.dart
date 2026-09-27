import 'package:application/features/anibla/data/models/request/comment_request.dart';
import 'package:application/features/anibla/data/models/response/comment_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.freezed.dart';

@freezed
sealed class CommentState with _$CommentState {
  factory CommentState({
    required CommentsState state,
    GetCommentRequest? props,
    String? error,
    CommentResponse? response,
    Map<String, CommentResponse>? replies,
  }) = _CommentState;
}

enum CommentsState { initial, ready, loading, error, success, endReached }
