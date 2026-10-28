import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/mano/data/models/data/mano_notification.dart';
import 'package:application/features/mano/data/models/main/mano_profile.dart';
import 'package:application/features/mano/data/models/request/mano_notification_req.dart';
import 'package:dartz/dartz.dart';

abstract class ManoProfileRepo {
  Future<Either<Failure, ManoProfile>> getProfile();
  Future<Either<Failure, bool>> updateProfile(ManoProfile profile);
  Future<Either<Failure, List<ManoNotification>>> getNotifications(ManoNotificationReq request);
}