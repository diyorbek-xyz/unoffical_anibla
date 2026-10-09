import 'package:application/features/player/presentation/controller/player_controller.dart';
import 'package:flutter/material.dart';

class PlayerScope extends InheritedWidget {
  const PlayerScope({super.key, required this.controller, required super.child});
  final PlayerController controller;

  static PlayerController of(BuildContext context) => context.getInheritedWidgetOfExactType<PlayerScope>()!.controller;

  @override
  bool updateShouldNotify(PlayerScope old) => false; // controller o'zgarmaydi
}
