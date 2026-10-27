import 'package:application/features/anibla/data/models/misc/premieres.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PremieresRepository {
  Future<Either<Failure, Premieres>> getPremieres(DateTime date);
}
