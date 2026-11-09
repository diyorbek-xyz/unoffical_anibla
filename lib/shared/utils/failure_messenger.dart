import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

Future<Either<Failure, T>> getFutureData<T>(
  Future<HttpResponse<T>> Function() future, {
  void Function(T, Response)? onData,
  void Function(Failure)? onError,
}) async {
  try {
    final res = await future();
    onData?.call(res.data, res.response);
    return Right(res.data);
  } catch (e) {
    final left = failureMaker<T>(e);
    onError?.call(left.value);
    return left;
  }
}

Left<Failure, T> failureMaker<T>(Object e) {
  if (e is DioException) return Left(ExceptionMapper.mapDioToFailure(e));
  return Left(UnknownFailure(e.toString()));
}
