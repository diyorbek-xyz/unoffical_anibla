import 'package:application/features/common/data/models/helpers/pagination.dart';
import 'package:equatable/equatable.dart';

class BigResponse<T> extends Equatable {
  final List<T> datas;
  final Pagination pagination;
  final String message;
  final bool success;
  final dynamic error;
  const BigResponse({required this.message, required this.success, required this.datas, this.error, required this.pagination});

  @override
  List<Object> get props => [success, message, datas, pagination, message, error];
}
