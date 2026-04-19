sealed class SearchEvent {
  const SearchEvent();
}

final class SearchAnime extends SearchEvent {
  final String title;
  const SearchAnime(this.title);
}
