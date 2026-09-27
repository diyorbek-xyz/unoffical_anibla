import 'package:application/features/anibla/data/enums/anime_type.dart';
import 'package:application/features/anibla/data/models/data/genre.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/request/search_request.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<Genre>>> getGenres();
  Future<Either<Failure, List<Anime>>> searchAnime(AnimeType type, SearchRequest query);
  Future<Either<Failure, List<Anime>>> getHistoy();
  Future<void> deleteFromHistory(String id);
  Future<void> clearHistoty();
}
