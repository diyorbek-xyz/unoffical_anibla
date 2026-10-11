import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:flutter/material.dart';

class PrivacySettings extends StatelessWidget {
  final Profile profile;
  const PrivacySettings(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    final setings = profile.mapOrNull(anibla: (value) => value.privacySettings)!;
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
  }
}
