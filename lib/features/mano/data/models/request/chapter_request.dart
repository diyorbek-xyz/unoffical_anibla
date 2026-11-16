import 'package:application/features/anibla/data/models/helper/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "chapter_request.g.dart";
part "chapter_request.freezed.dart";

enum OrderDirection {
  @JsonValue("desc")
  descending,
  @JsonValue("asc")
  ascending;

  bool get isDescending => this == .descending;
  bool get isAscending => this == .ascending;
}

@freezed
abstract class ChapterRequest with _$ChapterRequest {
  const ChapterRequest._();
  const factory ChapterRequest({
    @Default(1) int page,
    @Default(10000) int limit,
    @Default(0) int offset,
    @Default("") String search,
    @Default(OrderDirection.ascending) @JsonKey(name: "order_dir") OrderDirection order,
  }) = _ChapterRequest;

  ChapterRequest copyPagination([Pagination? p]) => copyWith(limit: p?.limit ?? limit, page: p?.next ?? page);

  factory ChapterRequest.fromJson(Map<String, dynamic> json) => _$ChapterRequestFromJson(json);
}
