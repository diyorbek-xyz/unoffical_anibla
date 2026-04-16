import 'package:application/features/comment/domain/entities/comment_entity.dart';

class CommentResponse {
  final List<CommentEntity> comments;
  final CommentPagination pagination;
  const CommentResponse({required this.comments, required this.pagination});
}

class CommentPagination {
  final int limit;
  final int page;
  final int pages;
  final int total;
  final int next;
  const CommentPagination({
    required this.limit,
    required this.total,
    required this.pages,
    required this.page,
    required this.next,
  });
}
