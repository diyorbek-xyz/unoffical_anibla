import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/mano/data/models/data/mano_notification.dart';
import 'package:application/features/mano/data/models/main/mano_profile.dart';
import 'package:application/features/mano/data/models/request/mano_notification_req.dart';
import 'package:application/features/mano/data/source/network/mano_notification_api.dart';
import 'package:application/features/mano/data/source/network/mano_profile_api.dart';
import 'package:application/features/mano/domain/repository/mano_profile_repo.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ManoProfileRepoImpl implements ManoProfileRepo {
  final ManoProfileApi _manoProfileApi;
  final ManoNotificationApi _notificationApi;
  const ManoProfileRepoImpl(this._manoProfileApi, this._notificationApi);
  final id = "ab975cc1-43f8-42a2-9d2c-8bc1f0aec5d0";

  @override
  Future<Either<Failure, ManoProfile>> getProfile() async {
    try {
      final httpResponse = await _manoProfileApi.getProfile(id);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfile(ManoProfile profile) async {
    try {
      final avatar = profile.avatar.toNullable();
      final name = profile.name.toNullable();
      await _manoProfileApi.updateProfile(id, {"picture_link": avatar, "first_name": name});
      return Right(true);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ManoNotification>>> getNotifications(ManoNotificationReq request) async {
    try {
      final httpRequest = await _notificationApi.getNotifications(request);
      return Right(httpRequest.data.notifications);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
