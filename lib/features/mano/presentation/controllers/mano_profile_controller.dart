import 'dart:io';

import 'package:application/core/network/resources/failure.dart';
import 'package:application/features/anibla/presentation/controllers/profile_errors.dart';
import 'package:application/features/auth/domain/repository/auth_repository.dart';
import 'package:application/features/mano/data/models/data/mano_notification.dart';
import 'package:application/features/mano/data/models/main/mano_profile.dart';
import 'package:application/features/mano/data/models/request/mano_notification_req.dart';
import 'package:application/features/mano/domain/repository/mano_profile_repo.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ManoProfileController {
  final ManoProfileRepo _manoProfileRepo;
  final AuthRepository _authRepository;
  ManoProfileController(this._manoProfileRepo, this._authRepository);

  final fakeProfile = ManoProfile();
  final fakeNotifications = List.generate(5, (index) => ManoNotification());
  late final profileSignal = futureSignal(() async {
    try {
      final either = await _manoProfileRepo.getProfile();
      return either.getData();
    } on Failure catch (e) {
      prints(["AAAAAAAAAAAA", e.toString()]);
      throw toProfileFailure(e);
    }
  });

  late final notificationSignal = futureSignal(() async {
    final either = await _manoProfileRepo.getNotifications(ManoNotificationReq());
    return either.getData();
  });

  ProfileFailure toProfileFailure(Failure fail) => switch (fail) {
    SessionLimitedFailure(:final sessions) => ProfileLimitSession(sessions),
    ServerFailure(:final status) =>
      (status == HttpStatus.unauthorized) ? ProfileUnauthorized() : ProfileFailed(ExceptionMapper.mapStatusToMessage(status)),
    _ => ProfileFailed(ExceptionMapper.mapFailureToMessage(fail)),
  };

  Future<void> loginManoWithAnibla() async {
    final callbackEither = await _authRepository.manoCallback();
    final data = callbackEither.getData();
    final profileEither = await _authRepository.manoAuth(data.code);
    profileEither.fold((l) => null, profileSignal.setValue);
  }
}
