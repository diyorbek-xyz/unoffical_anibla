import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/auth/presentation/pages/login_page.dart';
import 'package:application/features/home/presentation/pages/main_page.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: "view",
      path: "/",
      builder: (context, state) {
        return const MainPage();
      },
    ),
    GoRoute(
      name: "login",
      path: "/login",
      builder: (context, state) {
        return const LoginPage();
      },
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
    );
  }
}
