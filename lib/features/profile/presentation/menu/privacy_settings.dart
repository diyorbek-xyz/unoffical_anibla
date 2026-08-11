import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/presentation/controller/profile_controller.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PrivacySettings extends StatelessWidget {
  const PrivacySettings({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = sl<ProfileController>();
    return SignalBuilder(
      builder: (context) {
        final state = profileController.profileSignal.value;
        final setings = (state.value ?? profileController.fakeProfile).privacySettings;
        return ListsWidget(
          items: [
            ListModel(
              icon: Icons.message,
              label: "Kommentlarni korsatish",
              value: "Boshqalar siz yozgan izohlarni korishini sozlash",
              actions: [Switch(value: setings.showComments, onChanged: (value) {})],
            ),
            ListModel(
              icon: Icons.bookmark,
              label: "Sevimlilarni korsatish",
              value: "Boshqalar siz saqlagan animelarni korishini sozlash",
              actions: [Switch(value: setings.showFavorites, onChanged: (value) {})],
            ),
          ],
        );
      },
    );
  }
}
