import 'package:equatable/equatable.dart';

class PaginationEntity extends Equatable {
  final int total;
  final int limit;
  final int page;
  final int pages;
  const PaginationEntity({required this.limit, required this.page, required this.pages, required this.total});

  @override
  List<Object?> get props => [total, limit, page, pages];
}
