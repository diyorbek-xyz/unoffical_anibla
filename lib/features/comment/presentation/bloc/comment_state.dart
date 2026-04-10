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
  final dynamic data;
  const CommentSuccess(this.data);
}

final class CommentError extends CommentState {
  final String message;
  const CommentError(this.message);
}
