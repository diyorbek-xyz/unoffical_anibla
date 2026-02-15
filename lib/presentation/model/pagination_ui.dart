import 'package:application/domain/entities/common/pagination_entity.dart';

class PaginationUiModel {
  final int total;
  final int limit;
  final int page;
  final int pages;
  const PaginationUiModel({required this.total, required this.limit, required this.page, required this.pages});

  factory PaginationUiModel.fromEntity(PaginationEntity pagination) {
    return PaginationUiModel(
      total: pagination.total ?? 0,
      limit: pagination.limit ?? 0,
      page: pagination.page ?? 0,
      pages: pagination.pages ?? 0,
    );
  }
}
