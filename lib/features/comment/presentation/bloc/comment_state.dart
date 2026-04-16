import 'package:application/features/comment/domain/entities/response_entity.dart';

sealed class CommentState {
  const CommentState();
}

final class CommentInitial extends CommentState {
  const CommentInitial();
}

final class CommentLoading extends CommentState {
  const CommentLoading();
}

final class CommentSuccess extends CommentState {
  final CommentResponse response;
  const CommentSuccess(this.response);
}

final class CommentError extends CommentState {
  final String message;
  const CommentError(this.message);
}
