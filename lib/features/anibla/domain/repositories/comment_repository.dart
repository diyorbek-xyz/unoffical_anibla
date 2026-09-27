import 'package:application/features/anibla/data/models/request/comment_request.dart';
import 'package:application/features/anibla/data/models/response/comment_response.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepository {
  Future<Either<Failure, CommentResponse>> getAnimeComments(GetCommentRequest req);
  Future<Either<Failure, CommentResponse>> getReplies(String id);
}
