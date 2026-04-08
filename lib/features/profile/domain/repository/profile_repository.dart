import 'package:application/features/profile/domain/entities/profile_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, bool>> exitSession(String tokenId);
}
