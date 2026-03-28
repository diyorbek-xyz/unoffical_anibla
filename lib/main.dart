import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/routes/go_router.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
    );
  }
}
