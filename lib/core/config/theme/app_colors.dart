import 'package:flutter/material.dart';

class AppColors {
  static final primary = const Color(0xFFFFAA00);
  static final secondary = Colors.green;
  static final darkBackground = Color(0xFF202028);
  static final darkForeground = Color(0xFFFFFEE8);
  static final lightBackground = Color(0xFFFFFEE8);
  static final lightForeground = Color(0xFF202028);

  static final darkColorScheme = ColorScheme.fromSeed(seedColor: primary, secondary: secondary, brightness: Brightness.dark);
  static final lightColorScheme = ColorScheme.fromSeed(seedColor: primary, secondary: secondary, brightness: Brightness.light);
}

extension AppColorScheme on BuildContext {
  ColorScheme get appColors => ColorScheme.of(this);
}
