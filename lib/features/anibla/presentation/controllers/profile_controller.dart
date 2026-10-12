import 'dart:io';
import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:application/features/anibla/data/models/response/notification_response.dart';
import 'package:application/features/anibla/domain/repositories/notification_repository.dart';
import 'package:application/features/anibla/domain/repositories/profile_repository.dart';
import 'package:application/features/anibla/presentation/controllers/profile_errors.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:signals_flutter/signals_core.dart';

class ProfileController {
  final ProfileRepository _profileRepository;
  final NotificationRepository _notificationRepository;
  ProfileController(this._profileRepository, this._notificationRepository);

  late final aniblaProfile = futureSignal(() async {
    try {
      final either = await _profileRepository.getAniblaProfile();
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
  late final manoProfile = futureSignal(() async {
    final either = await _profileRepository.getManoProfile();
    return either.getData();
  });

  final fakeAnibla = Profile.anibla();
  final fakeMano = Profile.mano();

  late final notificationSignal = futureSignal(() async {
    final either = await _notificationRepository.getNotifications();
    return either.getData();
  });
  final fakeNotification = NotificationResponse();

  late final plansSignal = futureSignal(() async {
    final either = await _profileRepository.getPlans();
    return either.getData();
  });
  final fakePlans = List.generate(4, (index) => Plan());

  late final sessionExitSignal = signal(const SessionState());

  void exitSession(String tokenId) async {
    sessionExitSignal.set(SessionState(isLoading: true));
    try {
      final either = await _profileRepository.exitSession(tokenId);
      final success = either.getData();

      if (success) await aniblaProfile.refresh();
      sessionExitSignal.set(const SessionState());
    } on Failure catch (e) {
      sessionExitSignal.set(SessionState(hasError: true, error: e.message));
    } catch (e) {
      sessionExitSignal.set(const SessionState(hasError: true, error: "Nimadur xato ketti"));
    }
  }

  void changeProfile({String? url, String? name}) async {
    final oldName = name ?? aniblaProfile.value.value?.name ?? manoProfile.value.value!.name;
    final oldAvatar = url ?? aniblaProfile.value.value?.avatar ?? manoProfile.value.value!.avatar;
    final newProfile = await _profileRepository.updateBothProfile(Profile.anibla(avatar: oldAvatar, name: oldName));
    final success = newProfile.fold((l) => null, (r) => r);
    if (success!) refreshProfile();
  }

  Future<void> refreshProfile() async {
    aniblaProfile.refresh();
    manoProfile.refresh();
  }

  Future<void> refreshAll() async {
    aniblaProfile.refresh();
    plansSignal.refresh();
    notificationSignal.refresh();
  }
}
