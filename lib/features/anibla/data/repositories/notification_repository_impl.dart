import 'package:application/features/anibla/data/models/response/notification_response.dart';
import 'package:application/features/anibla/data/source/network/notifications_api.dart';
import 'package:application/features/anibla/domain/repositories/notification_repository.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationsApi _api;
  const NotificationRepositoryImpl(this._api);

  @override
  Future<Either<Failure, NotificationResponse>> getNotifications() async {
    try {
      final data = await _api.getNotifications();
      return Right(data);
    } on DioException catch (e) {
      return Left(ExceptionMapper.mapDioToFailure(e));
    }
  }
}
