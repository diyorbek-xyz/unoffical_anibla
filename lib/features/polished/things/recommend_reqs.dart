import 'package:application/features/anibla/data/models/request/animes_query.dart';

class RecommendRequests {
  static const mythAnimes = AnimesQuery(genres: ["681cf5e5a4f5ab34c05b2984"]);
  static const fightAnimes = AnimesQuery(genres: ["680bc6eb6f7f02c30d282bcc"]);
  static const thrillerAnimes = AnimesQuery(genres: ["680bc6626f7f02c30d282b9d"]);
  static const movieAnimes = AnimesQuery(type: .movies);
}
