import 'package:application/features/explore/data/models/search_query.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchAnime extends SearchEvent {
  final List<String>? categories;
  final List<String>? genres;
  final String? search;
  const SearchAnime({this.categories, this.genres, this.search});

  factory SearchAnime.fromSearch(String search) {
    final strList = search.split(" ");
    final searchList = strList.where((e) => !e.contains("c:") && !e.contains("g:"));
    final genres = strList
        .where((e) => e.contains("g:"))
        .map((e) => e.replaceFirst("g:", ""))
        .toList();
    final categories = strList
        .where((e) => e.contains("c:"))
        .map((e) => e.replaceFirst("c:", ""))
        .toList();
    return SearchAnime(search: searchList.join(" "), categories: categories, genres: genres);
  }
  bool get isEmpty =>
      (categories == null || categories!.isEmpty) &&
      (genres == null || genres!.isEmpty) &&
      (search == null || search!.isEmpty);

  SearchQuery get query =>
      SearchQuery(category: categories?.join(","), genre: genres?.join(","), search: search);
}
