import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/converter/list_converter.dart';
import 'package:application/features/mano/data/models/enum/sort_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "manga_request.g.dart";
part "manga_request.freezed.dart";

@freezed
abstract class MangaRequest with _$MangaRequest {
  const factory MangaRequest({
    @Default(1) @JsonKey(name: "page") int page,
    @Default(20) @JsonKey(name: "limit") int limit,
    @JsonKey(name: "types") MediaType? type,
    @JsonKey(name: "search") String? search,
    @JsonKey(name: "sort_by") SortType? sortBy,
    @JsonKey(name: "release_statuses") String? releaseStatus,
    @JsonKey(name: "age_restrictions") String? ageRestrictions,
    @JsonKey(name: "translation_statuses") String? translationStatus,
    @JsonKey(name: "genre_ids") @ListConverter() List<String>? genreIds,
    @JsonKey(name: "category_ids") @ListConverter() List<String>? categoryIds,
  }) = _MangaRequest;

  factory MangaRequest.fromJson(Map<String, dynamic> json) => _$MangaRequestFromJson(json);
}
