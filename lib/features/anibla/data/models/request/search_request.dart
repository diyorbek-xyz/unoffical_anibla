final class SearchRequest {
  final List<String>? categories;
  final List<String>? genres;
  final String? search;
  const SearchRequest({this.categories, this.genres, this.search});

  factory SearchRequest.fromSearch(String search) {
    final strList = search.split(" ");
    final searchList = strList.where((e) => !e.contains("c:") && !e.contains("g:"));
    final genres = strList.where((e) => e.contains("g:")).map((e) => e.replaceFirst("g:", "")).toList();
    final categories = strList.where((e) => e.contains("c:")).map((e) => e.replaceFirst("c:", "")).toList();
    return SearchRequest(search: searchList.join(" "), categories: categories, genres: genres);
  }
  bool get isEmpty =>
      (categories == null || categories!.isEmpty) && (genres == null || genres!.isEmpty) && (search == null || search!.isEmpty);

  Map<String, dynamic> toJson() => {"categories": categories?.join(","), "genres": genres?.join(","), "search": search};
}
