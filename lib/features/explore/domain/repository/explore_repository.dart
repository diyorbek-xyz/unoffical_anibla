import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/explore/data/models/search_query.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<GenreEntity>>> getGenres();
  Future<Either<Failure, List<AnimeEntity>>> searchAnime(String type, SearchQuery query);
  Future<Either<Failure, List<AnimeEntity>>> getHistoy();
}
