import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/mano/data/models/converter/list_converter.dart';
import 'package:application/features/mano/data/models/enum/sort_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'books_query.g.dart';
part 'books_query.freezed.dart';

enum BooksQueryType {
  manga,
  novels;

  @override
  String toString() => name;
}

@freezed
abstract class BooksQuery with _$BooksQuery {
  const BooksQuery._();
  const factory BooksQuery({
    @Default(1) @JsonKey(name: "page") int page,
    @Default(20) @JsonKey(name: "limit") int limit,
    @JsonKey(name: "types") MediaType? type,
    @JsonKey(name: "search") String? search,
    @JsonKey(name: "sort_by") SortType? sortBy,
    @JsonKey(name: "release_statuses") String? releaseStatus,
    @JsonKey(name: "age_restrictions") String? ageRestrictions,
    @JsonKey(name: "translation_statuses") String? translationStatus,
    @JsonKey(name: "genre_ids") @CommaConverter() List<String>? genreIds,
    @JsonKey(name: "category_ids") @CommaConverter() List<String>? categoryIds,
    BooksQueryType? queryType,
  }) = _BooksQuery;

  factory BooksQuery.fromQueryString(String query) => .fromJson(Uri(query: query).queryParameters);

  String toQueryString() => Uri(queryParameters: toJson()).query;

  factory BooksQuery.fromJson(Map<String, dynamic> json) => _$BooksQueryFromJson(json);
}
