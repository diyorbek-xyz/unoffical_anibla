import 'package:application/features/auth/data/models/login_model.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> getConfirm(
    LoginRequestModel body,
  );
  Future<Either<Failure, ConfirmedModel>> confirmCode(ConfirmModel body);
  Future<Either<Failure, bool>> logOut(String tokenId, bool isCurrent);
}
