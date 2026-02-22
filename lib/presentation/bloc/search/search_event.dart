sealed class SearchEvent {
  const SearchEvent();
}

final class SearchAnimes extends SearchEvent {
  final String query;
  final int limit;
  final int page;
  const SearchAnimes({required this.query, required this.limit, required this.page});
}

final class SearchClear extends SearchEvent {
  const SearchClear();
}
