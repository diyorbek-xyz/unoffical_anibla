import 'package:application/features/anibla/data/models/request/comment_request.dart';

sealed class CommentEvent {
  const CommentEvent();
}

final class InitComments extends CommentEvent {
  final GetCommentRequest request;
  const InitComments(this.request);
}

final class GetComments extends CommentEvent {
  const GetComments();
}

final class GetReplies extends CommentEvent {
  final String id;
  const GetReplies(this.id);
}
