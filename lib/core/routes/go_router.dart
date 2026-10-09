import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/presentation/pages/media_page.dart';
import 'package:application/features/anibla/presentation/pages/watch_page.dart';
import 'package:application/features/auth/presentation/pages/login_page.dart';
import 'package:application/features/anibla/presentation/pages/explore_page.dart';
import 'package:application/features/anibla/presentation/pages/home_page.dart';
import 'package:application/features/anibla/presentation/pages/main_page.dart';
import 'package:application/features/anibla/presentation/pages/profile_page.dart';
import 'package:application/features/anibla/presentation/pages/saveds_page.dart';
import 'package:application/features/ma-no/presentation/pages/books_page.dart';
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
          routes: [GoRoute(path: "/books", name: "books", builder: (context, state) => const BooksPage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/explore', name: "explore", builder: (context, state) => const ExplorePage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/saved', name: "saved", builder: (context, state) => const SavedsPage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: "/profile", name: "profile", builder: (context, state) => const ProfilePage())],
        ),
      ],
    ),
    GoRoute(
      name: "media",
      path: "/media",
      builder: (context, state) => MediaPage(.fromJson(state.uri.queryParameters)),
    ),
    GoRoute(
      name: "watch",
      path: "/watch",
      builder: (context, state) => WatchPage(.fromJson(state.uri.queryParameters)),
    ),
    GoRoute(name: "read", path: "/read", builder: (context, state) => MediaPage(MediaProps.fromJson(state.uri.queryParameters))),
    GoRoute(name: "login", path: "/login", builder: (context, state) => const LoginPage()),
    // ShellRoute(
    //   builder: (context, state, child) => AnimeProvider(child: child),
    //   routes: [
    //     GoRoute(
    //       name: "anime",
    //       path: '/anime',
    //       builder: (context, state) => AnimePage(props: AnimePageProps.fromJson(state.uri.queryParameters)),
    //     ),
    //     GoRoute(
    //       name: "watch",
    //       path: '/watch',
    //       builder: (context, state) => WatchPage(props: AnimePageProps.fromJson(state.uri.queryParameters)),
    //     ),
    //   ],
    // ),
  ],
);
