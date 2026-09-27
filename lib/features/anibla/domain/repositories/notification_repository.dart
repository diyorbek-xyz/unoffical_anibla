import 'package:application/features/anibla/data/models/response/notification_response.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationResponse>> getNotifications();
}
