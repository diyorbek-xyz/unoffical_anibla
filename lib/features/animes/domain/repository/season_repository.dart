import 'package:application/features/animes/domain/entities/season_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SeasonRepository {
  Future<Either<Failure, List<SeasonEntity>>> getAllSeasons(String animeSlug);
}
