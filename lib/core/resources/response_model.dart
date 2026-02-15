import 'package:equatable/equatable.dart';

abstract class ResponseModel<T> extends Equatable {
  final bool success;
  final String message;
  final T data;
  const ResponseModel({required this.message, required this.success, required this.data});

  @override
  List<Object?> get props => [success, message, data];
}