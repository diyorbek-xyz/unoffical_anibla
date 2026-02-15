class GetSeasonsParams {
  final String animeSlug;
  const GetSeasonsParams({required this.animeSlug});
}

class GetSeasonParams {
  final String seasonSlug;
  final String animeSlug;
  const GetSeasonParams({required this.animeSlug, required this.seasonSlug});
}
