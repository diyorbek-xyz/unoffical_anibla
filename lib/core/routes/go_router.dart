import 'package:application/features/animes/data/models/page_props.dart';
import 'package:application/features/animes/presentation/pages/anime_page.dart';
import 'package:application/features/animes/presentation/pages/anime_provider.dart';
import 'package:application/features/animes/presentation/pages/watch_page.dart';
import 'package:application/features/auth/presentation/pages/login_page.dart';
import 'package:application/features/explore/presentation/pages/explore_page.dart';
import 'package:application/features/main/presentation/pages/home_page.dart';
import 'package:application/features/main/presentation/pages/main_page.dart';
import 'package:application/features/profile/presentation/menu/devices_menu.dart';
import 'package:application/features/profile/presentation/menu/infos_menu.dart';
import 'package:application/features/profile/presentation/menu/notifications_menu.dart';
import 'package:application/features/profile/presentation/menu/plans_menu.dart';
import 'package:application/features/profile/presentation/pages/privacy_settings.dart';
import 'package:application/features/profile/presentation/pages/profile_page.dart';
import 'package:application/features/profile/presentation/pages/saveds_page.dart';
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
          routes: [GoRoute(path: '/home', name: "home", builder: (context, state) => const HomePage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/explore', name: "explore", builder: (context, state) => const ExplorePage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/saved', name: "saved", builder: (context, state) => const SavedsPage())],
        ),
        StatefulShellBranch(
          routes: [
            ShellRoute(
              builder: (context, state, shell) => ProfilePage(child: shell),
              routes: [
                GoRoute(path: "/profile/infos", name: "infos", builder: (context, state) => const ProfileInfosMenu()),
                GoRoute(path: "/profile/notifications", name: "notifications", builder: (context, state) => const NotificationsMenu()),
                GoRoute(path: "/profile/plans", name: "plans", builder: (context, state) => const PlansMenu()),
                GoRoute(path: "/profile/devices", name: "devices", builder: (context, state) => const ProfileDevicesMenu()),
                GoRoute(path: "/profile/privacy", name: "privacy", builder: (context, state) => const PrivacySettings()),
              ],
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) => AnimeProvider(child: child),
      routes: [
        GoRoute(
          name: "anime",
          path: '/anime',
          builder: (context, state) =>
              AnimePage(slug: state.uri.queryParameters['slug'].toString(), typeSTR: state.uri.queryParameters['type']?.toString() ?? "Series"),
        ),
        GoRoute(
          name: "watch",
          path: '/watch',
          builder: (context, state) => WatchPage(props: AnimePageProps.fromJson(state.uri.queryParameters)),
        ),
      ],
    ),
    GoRoute(name: "login", path: "/login", builder: (context, state) => const LoginPage()),
  ],
);
