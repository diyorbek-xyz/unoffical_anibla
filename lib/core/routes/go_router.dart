import 'package:application/features/auth/presentation/pages/login_page.dart';
import 'package:application/features/main/presentation/pages/home_page.dart';
import 'package:application/features/main/presentation/pages/main_page.dart';
import 'package:application/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/home",
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainPage(shell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [GoRoute(path: '/home', builder: (context, state) => const HomePage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/explore', builder: (context, state) => const Text("Explore"))],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/saved', builder: (context, state) => const Text("Saved"))],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/profile', builder: (context, state) => const ProfilePage())],
        ),
      ],
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
