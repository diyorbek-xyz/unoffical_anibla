import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/presentation/pages/media_page.dart';
import 'package:application/features/anibla/presentation/pages/profile_wrapper.dart';
import 'package:application/features/anibla/presentation/pages/watch_page.dart';
import 'package:application/features/auth/presentation/pages/login_page.dart';
import 'package:application/features/anibla/presentation/pages/explore_page.dart';
import 'package:application/features/anibla/presentation/pages/home_page.dart';
import 'package:application/features/anibla/presentation/pages/main_page.dart';
import 'package:application/features/anibla/presentation/pages/saveds_page.dart';
import 'package:application/features/anibla/presentation/pages/manga_page.dart';
import 'package:application/features/anibla/presentation/pages/novel_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter routerConfig(String initial) => GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: initial,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainPage(shell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [GoRoute(path: '/', name: "home", builder: (context, state) => const HomePage())],
        ),
        StatefulShellBranch(
          initialLocation: "/mangas",
          routes: [
            GoRoute(path: "/mangas", name: "mangas", builder: (context, state) => const MangaPage()),
            GoRoute(path: "/novels", name: "novels", builder: (context, state) => const NovelPage()),
          ],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/explore', name: "explore", builder: (context, state) => const ExplorePage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/saved', name: "saved", builder: (context, state) => const SavedsPage())],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/profile/anibla",
              name: "anibla",
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ProfileWrapper(false)),
            ),
            GoRoute(
              path: "/profile/mano",
              name: "mano",
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ProfileWrapper(true)),
            ),
          ],
        ),
      ],
    ),
    GoRoute(name: "media", path: "/media", builder: (context, state) => MediaPage(.fromJson(state.uri.queryParameters))),
    GoRoute(name: "watch", path: "/watch", builder: (context, state) => WatchPage(.fromJson(state.uri.queryParameters))),
    GoRoute(name: "read", path: "/read", builder: (context, state) => MediaPage(MediaProps.fromJson(state.uri.queryParameters))),
    GoRoute(name: "login", path: "/login", builder: (context, state) => const LoginPage()),
  ],
);
