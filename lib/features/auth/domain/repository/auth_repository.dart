import 'package:application/core/resources/data_state.dart';
import 'package:application/features/auth/data/models/login_model.dart';

abstract class AuthRepository {
  Future<DataState<LoginResponseModel>> getConfirm(LoginRequestModel body);
  Future<DataState<ConfirmedModel>> confirmCode(ConfirmModel body);
}
