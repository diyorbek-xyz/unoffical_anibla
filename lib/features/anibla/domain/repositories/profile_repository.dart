import 'package:application/features/anibla/data/models/main/anibla_profile.dart';
import 'package:application/features/mano/data/models/main/mano_profile.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, bool>> exitSession(String tokenId);
  Future<Either<Failure, List<Plan>>> getPlans();
  Future<Either<Failure, ManoProfile>> getManoProfile();
  Future<Either<Failure, AniblaProfile>> getAniblaProfile();
  Future<Either<Failure, bool>> updateManoProfile(ManoProfile profile);
  Future<Either<Failure, bool>> updateAniblaProfile(AniblaProfile profile);
}
