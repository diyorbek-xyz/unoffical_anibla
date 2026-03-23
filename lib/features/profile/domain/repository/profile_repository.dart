import 'package:application/core/resources/data_state.dart';

abstract class ProfileRepository {
  Future<DataState<dynamic>> getProfile();
}
