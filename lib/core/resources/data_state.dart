import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

abstract class DataState<T> {
  final T? data;
  final Response? response;
  final DioException? exception;
  const DataState({this.data, this.exception, this.response});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data, [Response? response]) : super(data: data, response: response);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException exception, {super.response, super.data}) : super(exception: exception);
}
