import 'package:application/features/animes/presentation/pages/anime_page.dart';
import 'package:application/features/animes/presentation/pages/anime_provider.dart';
import 'package:application/features/animes/presentation/pages/watch_page.dart';
import 'package:application/features/auth/presentation/pages/login_page.dart';
import 'package:application/features/explore/presentation/pages/explore_page.dart';
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
          routes: [
            GoRoute(path: '/home', builder: (context, state) => const HomePage()),
            ShellRoute(
              builder: (context, state, child) => AnimeProvider(child: child),
              routes: [
                GoRoute(
                  name: "anime",
                  path: '/anime/:type/:slug',
                  builder: (context, state) => AnimePage(
                    slug: state.pathParameters['slug'].toString(),
                    type: state.pathParameters['type']?.toString() ?? "Series",
                  ),
                ),
                GoRoute(
                  name: "watch",
                  path: '/watch/:type/:slug',
                  builder: (context, state) => WatchPage(
                    slug: state.pathParameters['slug'].toString(),
                    type: state.pathParameters['type']?.toString() ?? "Series",
                    episode: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/explore', builder: (context, state) => const ExplorePage())],
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
