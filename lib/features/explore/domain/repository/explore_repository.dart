import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/explore/data/models/search_query.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<GenreEntity>>> getGenres();
  Future<Either<Failure, List<AnimeEntity>>> searchAnime(AnimeType type, SearchQuery query);
  Future<Either<Failure, List<AnimeEntity>>> getHistoy();
  Future<void> deleteFromHistory(String id);
  Future<void> clearHistoty();
}
