import 'package:application/core/resources/data_state.dart';
import 'package:application/data/models/auth/verify.dart';
import 'package:application/domain/entities/auth/account_entity.dart';

abstract class AuthRepository {
  Future<DataState<int>> loginByPhone(int params);
  Future<DataState<AccountEntity>> verifyNumber(VerifyModel params);
}
