import 'package:application/features/mano/data/models/converter/list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animes_query.g.dart';
part 'animes_query.freezed.dart';

enum AnimesQueryType {
  series,
  movies,
  media;

  @override
  String toString() => name;
}

@freezed
abstract class AnimesQuery with _$AnimesQuery {
  const AnimesQuery._();
  const factory AnimesQuery({
    @Default(1) int page,
    @Default(0) int limit,
    String? search,
    @Default(AnimesQueryType.media) AnimesQueryType type,
    @CommaConverter() List<String>? genres,
    @CommaConverter() List<String>? categories,
  }) = _AnimesQuery;
  factory AnimesQuery.fromJson(Map<String, dynamic> json) => _$AnimesQueryFromJson(json);

  factory AnimesQuery.fromString(String search) {
    final strList = search.split(" ");
    final searchList = strList.where((e) => !e.contains("c:") && !e.contains("g:"));
    final genres = strList.where((e) => e.contains("g:")).map((e) => e.replaceFirst("g:", "")).toList();
    final categories = strList.where((e) => e.contains("c:")).map((e) => e.replaceFirst("c:", "")).toList();
    return AnimesQuery(search: searchList.join(" "), categories: categories, genres: genres);
  }

  factory AnimesQuery.fromQueryString(String query) => .fromJson(Uri(query: query).queryParameters);

  String toQueryString() => Uri(queryParameters: toJson()).query;

  bool get isEmpty =>
      (categories == null || categories!.isEmpty) && (genres == null || genres!.isEmpty) && (search == null || search!.isEmpty);
}
