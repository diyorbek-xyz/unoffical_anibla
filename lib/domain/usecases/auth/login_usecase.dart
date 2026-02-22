import 'package:application/core/resources/data_state.dart';
import 'package:application/core/usecases/usecase.dart';
import 'package:application/domain/repositories/auth/auth_repository.dart';

class LoginUsecase implements UseCase<DataState<int>, int> {
  final AuthRepository repository;
  const LoginUsecase(this.repository);
  @override
  Future<DataState<int>> call(int phone) {
    return repository.loginByPhone(phone);
  }
}
