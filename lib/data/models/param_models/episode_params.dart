class GetEpisodesParams {
  final String animeSlug;
  final String seasonSlug;
  const GetEpisodesParams({required this.animeSlug, required this.seasonSlug});
}

class GetEpisodeParams {
  final String animeSlug;
  final String seasonSlug;
  final String episodeSlug;
  const GetEpisodeParams({required this.animeSlug, required this.seasonSlug, required this.episodeSlug});
}
