sealed class AnimeEvent {
  const AnimeEvent();
}

final class GetSerie extends AnimeEvent {
  final String slug;
  const GetSerie(this.slug);
}
