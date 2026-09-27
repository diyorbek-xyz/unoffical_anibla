import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:flutter/material.dart';

class SavesMenu extends StatelessWidget {
  final Profile profile;
  const SavesMenu({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Text("Saves");
  }
}
