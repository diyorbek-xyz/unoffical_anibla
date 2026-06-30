import 'package:application/features/comment/data/models/props.dart';
import 'package:application/features/comment/domain/entities/response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.freezed.dart';

@freezed
sealed class CommentState with _$CommentState {
  factory CommentState({
    required CommentsState state,
    GetCommentsProps? props,
    String? error,
    CommentResponse? response,
    Map<String, CommentResponse>? replies,
  }) = _CommentState;
}

enum CommentsState { initial, ready, loading, error, success, endReached }
