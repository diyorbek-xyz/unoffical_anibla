import 'package:application/features/comment/data/models/props.dart';

sealed class CommentEvent {
  const CommentEvent();
}

final class InitComments extends CommentEvent {
  final GetCommentsProps props;
  const InitComments(this.props);
}

final class GetComments extends CommentEvent {
  const GetComments();
}

final class GetReplies extends CommentEvent {
  final String id;
  const GetReplies(this.id);
}
