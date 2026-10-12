import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/auth/data/models/mano_callback.dart';
import 'package:application/features/auth/data/models/mano_callfront.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> getConfirm(LoginRequestModel body);
  Future<Either<Failure, ConfirmedModel>> confirmCode(ConfirmModel body);
  Future<Either<Failure, bool>> logOut(String tokenId, bool isCurrent);

  Future<Either<Failure, ManoCallback>> manoCallback(ManoCallfront request);
  Future<Either<Failure, Profile>> manoAuth(String userId);
  Future<Either<Failure, Profile>> manoRefreshToken();
}
