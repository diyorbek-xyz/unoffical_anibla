import 'package:application/features/profile/data/mapper/notification_mapper.dart';
import 'package:application/features/profile/data/source/remote/notifications_api.dart';
import 'package:application/features/profile/domain/entities/notifications/notification_response_entity.dart';
import 'package:application/features/profile/domain/repository/notification_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationsApi _api;
  const NotificationRepositoryImpl(this._api);

  @override
  Future<Either<Failure, NotificationResponseEntity>> getNotifications() async {
    try {
      final data = await _api.getNotifications();
      return Right(NotificationMapper.responseFromModel(data));
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
