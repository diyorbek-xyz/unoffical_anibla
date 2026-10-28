import 'package:application/features/anibla/data/models/main/anibla_profile.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/anibla/data/models/response/anibla_notification_res.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, AniblaProfile>> getProfile();
  Future<Either<Failure, bool>> updateProfile(AniblaProfile profile);
  Future<Either<Failure, bool>> exitSession(String tokenId);
  Future<Either<Failure, List<Plan>>> getPlans();
  Future<Either<Failure, AniblaNotificationRes>> getNotifications();
}
