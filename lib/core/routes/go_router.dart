import 'package:application/features/anibla/presentation/wrappers/media_wrapper.dart';
import 'package:application/features/anibla/presentation/wrappers/profile_wrapper.dart';
import 'package:application/features/anibla/presentation/pages/watch_page.dart';
import 'package:application/features/auth/presentation/pages/login_page.dart';
import 'package:application/features/anibla/presentation/pages/explore_page.dart';
import 'package:application/features/anibla/presentation/pages/main_page.dart';
import 'package:application/features/anibla/presentation/pages/saveds_page.dart';
import 'package:application/features/mano/presentation/pages/manga_page.dart';
import 'package:application/features/mano/presentation/pages/novel_page.dart';
import 'package:application/features/mano/presentation/pages/read_page.dart';
import 'package:application/features/polished/presentation/pages/home.dart';
import 'package:application/features/polished/presentation/pages/medias_list.dart';
import 'package:material_ui/material_ui.dart';
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
          routes: [GoRoute(path: '/', name: "home", builder: (context, state) => PolishedHomePage())],
        ),
        StatefulShellBranch(
          initialLocation: "/mangas",
          routes: [
            GoRoute(path: "/mangas", name: "mangas", builder: (context, state) => MangaPage()),
            GoRoute(path: "/novels", name: "novels", builder: (context, state) => NovelPage()),
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
    GoRoute(name: "media", path: "/media", builder: (context, state) => MediaWrapper(.fromJson(state.uri.queryParameters))),
    GoRoute(name: "watch", path: "/watch", builder: (context, state) => WatchPage(.fromJson(state.uri.queryParameters))),
    GoRoute(name: "read", path: "/read", builder: (context, state) => ReadPage(.fromJson(state.uri.queryParameters))),
    GoRoute(name: "media-list", path: "/media-list", builder: (context, state) => MediasList.fromRoute(state)),
    GoRoute(name: "login", path: "/login", builder: (context, state) => const LoginPage()),
    GoRoute(name: "p-home", path: "/p-home", builder: (context, state) => const PolishedHomePage()),
  ],
);
