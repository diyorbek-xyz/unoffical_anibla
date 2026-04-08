import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<GenreEntity>>> getGenres();
}
