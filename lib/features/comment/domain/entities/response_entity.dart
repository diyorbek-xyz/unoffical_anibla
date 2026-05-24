import 'package:application/features/comment/domain/entities/comment_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_entity.freezed.dart';

@freezed
sealed class CommentResponse with _$CommentResponse {
  factory CommentResponse({required List<CommentEntity> comments, required CommentPagination pagination}) = _CommentResponse;
}

class CommentPagination {
  final int limit;
  final int page;
  final int pages;
  final int total;
  final int next;
  const CommentPagination({required this.limit, required this.total, required this.pages, required this.page, required this.next});
}
