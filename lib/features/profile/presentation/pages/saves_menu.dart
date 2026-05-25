import 'package:application/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';

class SavesMenu extends StatelessWidget {
  final ProfileEntity profile;
  const SavesMenu({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Text("Notifications");
  }
}
