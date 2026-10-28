import 'dart:io';
import 'package:application/features/anibla/data/models/main/anibla_profile.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/misc/plan.dart';
import 'package:application/features/anibla/data/models/response/anibla_notification_res.dart';
import 'package:application/features/anibla/domain/repositories/profile_repository.dart';
import 'package:application/features/anibla/presentation/controllers/profile_errors.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:signals_flutter/signals_core.dart';

class ProfileController {
  final ProfileRepository _profileRepository;
  ProfileController(this._profileRepository);

  late final profileSignal = futureSignal(() async {
    try {
      final either = await _profileRepository.getProfile();
      return either.getData();
    } on Failure catch (e) {
      throw toProfileFailure(e);
    }
  });
  late final notificationSignal = futureSignal(() async {
    final either = await _profileRepository.getNotifications();
    return either.getData();
  });
  late final plansSignal = futureSignal(() async {
    final either = await _profileRepository.getPlans();
    return either.getData();
  });
  late final sessionExitSignal = signal(const SessionState());
  final fakeAnibla = AniblaProfile();
  final fakeNotification = AniblaNotificationRes();
  final fakePlans = List.generate(4, (index) => Plan());

  ProfileFailure toProfileFailure(Failure fail) => switch (fail) {
    SessionLimitedFailure(:final sessions) => ProfileLimitSession(sessions),
    ServerFailure(:final status) =>
      (status == HttpStatus.unauthorized) ? ProfileUnauthorized() : ProfileFailed(ExceptionMapper.mapStatusToMessage(status)),
    _ => ProfileFailed(ExceptionMapper.mapFailureToMessage(fail)),
  };

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

  void changeProfile({String? url, String? name}) async {
    var newP = AniblaProfile();
    final oldName = name ?? profileSignal.value.value?.name;
    final oldAvatar = url ?? profileSignal.value.value?.avatar;
    if (oldAvatar != null) newP = newP.copyWith(avatar: oldAvatar);
    if (oldName != null) newP = newP.copyWith(name: oldName);
    final newProfile = await _profileRepository.updateProfile(newP);
    final success = newProfile.fold((l) => null, (r) => r);
    if (success!) refreshProfile();
  }

  Future<void> refreshProfile() async {
    profileSignal.refresh();
  }

  Future<void> refreshAll() async {
    profileSignal.refresh();
    plansSignal.refresh();
    notificationSignal.refresh();
  }
}
