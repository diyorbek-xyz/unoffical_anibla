import 'package:application/features/anibla/data/models/request/comment_request.dart';
import 'package:application/features/anibla/data/models/response/comment_response.dart';
import 'package:application/features/anibla/data/source/network/comment_api.dart';
import 'package:application/features/anibla/domain/repositories/comment_repository.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentApi _apiService;
  CommentRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, CommentResponse>> getAnimeComments(GetCommentRequest req) async {
    try {
      final httpResponse = await _apiService.getAnimeComments(req.type.toLowerCase(), req.id, req.query);
      return Right(httpResponse.data.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, CommentResponse>> getReplies(String id) async {
    try {
      final httpResponse = await _apiService.getReplyComments(id);
      return Right(httpResponse.data.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
