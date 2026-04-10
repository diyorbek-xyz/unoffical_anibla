import 'package:application/features/comment/data/models/props.dart';
import 'package:application/features/comment/data/source/remote/comment_api.dart';
import 'package:application/features/comment/domain/repository/comment_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentApi _apiService;
  CommentRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, dynamic>> getAnimeComments(
    GetCommentsProps props,
  ) async {
    try {
      final httpResponse = await _apiService.getAnimeComments(
        props.type,
        props.id,
        props.query,
      );
      return Right(httpResponse.data.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
