import 'package:application/features/animes/data/models/season_model.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SeasonRepository {
  Future<Either<Failure, List<SeasonModel>>> getAllSeasons(String animeSlug);
}
