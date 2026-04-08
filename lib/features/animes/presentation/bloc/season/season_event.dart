sealed class SeasonEvent {
  const SeasonEvent();
}

final class GetAllSeasons extends SeasonEvent {
  final String animeSlug;
  const GetAllSeasons(this.animeSlug);
}

final class GetOneSeason extends SeasonEvent {
  final String animeSlug;
  final String seasonSlug;
  const GetOneSeason(this.animeSlug, this.seasonSlug);
}
