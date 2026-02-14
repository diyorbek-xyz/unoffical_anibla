import 'package:equatable/equatable.dart';

class PaginationEntity extends Equatable {
  final int? total;
  final int? limit;
  final int? page;
  final int? pages;
  const PaginationEntity({this.total, this.limit, this.page, this.pages});

  @override
  List<Object?> get props => [total, limit, page, pages];
}
