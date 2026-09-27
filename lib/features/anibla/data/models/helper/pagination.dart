import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'pagination.g.dart';
part 'pagination.freezed.dart';

@HiveType(typeId: 0)
@Freezed()
abstract class Pagination with _$Pagination {
  const Pagination._();
  const factory Pagination({
    @Default(0) @HiveField(0) int limit,
    @Default(0) @HiveField(1) int page,
    @Default(0) @HiveField(2) int pages,
    @Default(0) @HiveField(3) int total,
    @Default(0) @HiveField(4) int next,
  }) = _Pagination;

  bool get hasMore => (page < pages) && pages > 0;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
