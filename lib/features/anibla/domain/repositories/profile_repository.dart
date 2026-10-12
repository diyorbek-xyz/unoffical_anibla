import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, bool>> exitSession(String tokenId);
  Future<Either<Failure, List<Plan>>> getPlans();
  Future<Either<Failure, Profile>> getManoProfile();
  Future<Either<Failure, Profile>> getAniblaProfile();
  Future<Either<Failure, bool>> updateBothProfile(Profile profile);
}
