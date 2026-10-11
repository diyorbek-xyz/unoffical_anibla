import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/routes/go_router.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/widgets/keyboard_shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main(List<String> args) async {
  await initializeDependencies();
  final config = routerConfig("/${args.join("/")}");

  runApp(MainApp(config));
}

class MainApp extends StatelessWidget {
  final GoRouter config;
  const MainApp(this.config, {super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerConfig: config,
    debugShowCheckedModeBanner: false,
    theme: AppThemes.darkTheme,
    builder: (_, child) => KeyboardShortcuts(config, child!),
  );
}

final MOBILE_WIDTH = 600;
