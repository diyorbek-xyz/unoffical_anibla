import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, AnimeEntity>> getSerie(String slug);
}
