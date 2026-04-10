sealed class EpisodeEvent {
  const EpisodeEvent();
}

final class GetEpisodes extends EpisodeEvent {
  final String animeSlug;
  final String seasonSlug;
  const GetEpisodes(this.animeSlug, this.seasonSlug);
}
