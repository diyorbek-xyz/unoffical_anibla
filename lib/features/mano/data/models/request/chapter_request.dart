import 'package:freezed_annotation/freezed_annotation.dart';

part "chapter_request.g.dart";
part "chapter_request.freezed.dart";

enum OrderDirection {
  @JsonValue("desc")
  descending,
  @JsonValue("asc")
  ascending,
}

@freezed
abstract class ChapterRequest with _$ChapterRequest {
  const factory ChapterRequest({
    @Default(1) int page,
    @Default(10000) int limit,
    @Default(0) int offset,
    @Default("") String search,
    @Default(OrderDirection.ascending) @JsonKey(name: "order_dir") OrderDirection order,
  }) = _ChapterRequest;

  factory ChapterRequest.fromJson(Map<String, dynamic> json) => _$ChapterRequestFromJson(json);
}
