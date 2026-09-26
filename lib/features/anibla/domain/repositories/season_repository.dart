import 'package:application/features/anibla/data/models/main/season.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SeasonRepository {
  Future<Either<Failure, List<Season>>> getAllSeasons(String animeSlug);
}
