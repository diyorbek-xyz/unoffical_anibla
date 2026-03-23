import 'dart:io';

import 'package:application/core/network/errors.dart';
import 'package:application/core/resources/api_response.dart';
import 'package:application/core/resources/data_state.dart';
import 'package:application/features/profile/data/models/session_model.dart';
import 'package:application/features/profile/data/source/remote/profile_api.dart';
import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApi _apiService;
  ProfileRepositoryImpl(this._apiService);

  @override
  Future<DataState<dynamic>> getProfile() async {
    try {
      final httpResponse = await _apiService.getProfile();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(screamFromResponse(httpResponse.response));
      }
    } on DioException catch (e) {
      if (e.error == Errors.tooManySessions) {
        return DataFailed(
          e,
          data: ApiResponse.fromJson(e.response!.data, (json) => SessionsModel.fromJson(json as Map<String, dynamic>).toEntity()).data,
        );
      } else {
        return DataFailed(e,data: "hello");
      }
    }
  }
}
