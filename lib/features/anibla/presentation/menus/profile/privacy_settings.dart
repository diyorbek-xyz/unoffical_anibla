import 'package:application/features/anibla/data/models/data/privacy.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:flutter/material.dart';

class PrivacySettings extends StatelessWidget {
  final Privacy privacy;
  const PrivacySettings(this.privacy, {super.key});

  @override
  Widget build(BuildContext context) => ListsWidget(
    items: [
      ListModel(
        icon: Icons.message,
        label: "Kommentlarni korsatish",
        value: "Boshqalar siz yozgan izohlarni korishini sozlash",
        actions: [Switch(value: privacy.showComments, onChanged: (value) {})],
      ),
      ListModel(
        icon: Icons.bookmark,
        label: "Sevimlilarni korsatish",
        value: "Boshqalar siz saqlagan animelarni korishini sozlash",
        actions: [Switch(value: privacy.showFavorites, onChanged: (value) {})],
      ),
    ],
  );
}
