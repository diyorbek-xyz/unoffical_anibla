import 'package:application/features/comment/data/models/props.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepository {
  Future<Either<Failure, dynamic>> getAnimeComments(GetCommentsProps props);
}
