import 'package:application/features/profile/domain/entities/notifications/notification_response_entity.dart';
import 'package:application/network/resources/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationResponseEntity>> getNotifications();
}
