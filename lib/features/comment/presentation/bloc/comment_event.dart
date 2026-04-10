import 'package:application/features/comment/data/models/props.dart';

sealed class CommentEvent {
  const CommentEvent();
}

final class GetComments extends CommentEvent {
  final GetCommentsProps props;
  const GetComments(this.props);
}
