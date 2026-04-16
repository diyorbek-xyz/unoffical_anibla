sealed class AnimeEvent {
  const AnimeEvent();
}

final class GetSerie extends AnimeEvent {
  final String slug;
  final String type;
  const GetSerie({required this.slug, required this.type});
}
