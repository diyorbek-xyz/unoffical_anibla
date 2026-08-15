import 'dart:io';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/profile/data/mapper/notification_mapper.dart';
import 'package:application/features/profile/data/mapper/plan_mapper.dart';
import 'package:application/features/profile/data/mapper/profile_mapper.dart';
import 'package:application/features/profile/domain/repository/notification_repository.dart';
import 'package:application/features/profile/domain/repository/profile_repository.dart';
import 'package:application/features/profile/presentation/controller/profile_errors.dart';
import 'package:application/network/resources/failure.dart';
import 'package:signals_flutter/signals_core.dart';

class ProfileController {
  final ProfileRepository _profileRepository;
  final NotificationRepository _notificationRepository;
  ProfileController(this._profileRepository, this._notificationRepository);

  late final profileSignal = futureSignal(() async {
    try {
      final either = await _profileRepository.getProfile();
      return either.getData();
    } on Failure catch (e) {
      throw switch (e) {
        SessionLimitedFailure(:final sessions) => ProfileLimitSession(sessions),
        ServerFailure(:final status) =>
          (status == HttpStatus.unauthorized) ? ProfileUnauthorized() : ProfileFailed(ExceptionMapper.mapStatusToMessage(status)),
        _ => ProfileFailed(ExceptionMapper.mapFailureToMessage(e)),
      };
    }
  });
  final fakeProfile = ProfileMapper.modelToEntity(null);

  late final notificationSignal = futureSignal(() async {
    final either = await _notificationRepository.getNotifications();
    return either.getData();
  });
  final fakeNotification = NotificationMapper.responseFromModel(null);

  late final plansSignal = futureSignal(() async {
    final either = await _profileRepository.getPlans();
    return either.getData();
  });
  final fakePlans = List.generate(4, (index) => PlanMapper.modelToEntity(null));

  late final sessionExitSignal = signal(const SessionState());
  void exitSession(String tokenId) async {
    sessionExitSignal.set(SessionState(isLoading: true));
    try {
      final either = await _profileRepository.exitSession(tokenId);
      final success = either.getData();

      if (success) await profileSignal.refresh();
      sessionExitSignal.set(const SessionState());
    } on Failure catch (e) {
      sessionExitSignal.set(SessionState(hasError: true, error: e.message));
    } catch (e) {
      sessionExitSignal.set(const SessionState(hasError: true, error: "Nimadur xato ketti"));
    }
  }

  Future<void> refreshAll() async {
    profileSignal.refresh();
    plansSignal.refresh();
    notificationSignal.refresh();
  }
}
