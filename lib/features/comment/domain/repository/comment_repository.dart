import 'package:application/features/comment/data/models/props.dart';
import 'package:application/features/comment/domain/entities/response_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepository {
  Future<Either<Failure, CommentResponse>> getAnimeComments(GetCommentsProps props);
  Future<Either<Failure, CommentResponse>> getReplies(String id);
}
