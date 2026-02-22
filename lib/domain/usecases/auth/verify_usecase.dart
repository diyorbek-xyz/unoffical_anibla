import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/data/models/auth/verify.dart';
import 'package:application/domain/entities/auth/account_entity.dart';
import 'package:application/domain/repositories/auth/auth_repository.dart';

class VerifyUsecase implements UseCase<DataState<AccountEntity>,VerifyModel> {
  final AuthRepository repository;
  const VerifyUsecase(this.repository);
  @override
  Future<DataState<AccountEntity>> call(VerifyModel params) {
    return repository.verifyNumber(params);
  }
}