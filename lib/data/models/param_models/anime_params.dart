class GetAnimesParams {
  final String type;
  final String from;
  final String? search;
  final int? limit;
  final int? page;
  const GetAnimesParams({required this.type, required this.from, this.search, this.limit, this.page});
}

class GetAnimeDetailsParams {
  final String slug;
  final String type;
  const GetAnimeDetailsParams({required this.slug, required this.type});
}
