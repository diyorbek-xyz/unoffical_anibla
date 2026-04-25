// import 'package:application/features/profile/presentation/pages/devices_menu.dart';
// import 'package:application/features/profile/presentation/pages/infos_menu.dart';
// import 'package:application/features/profile/presentation/pages/last_anime_menu.dart';
// import 'package:application/features/profile/presentation/pages/profile_page.dart';
// import 'package:application/features/profile/presentation/pages/profile_provider.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter/widgets.dart';
// import 'package:go_router/go_router.dart';

// CustomTransitionPage transitionBuilder(Widget child, GoRouterState state) {
//   return NoTransitionPage(key: state.pageKey, child: child);
// }

// class PageName {
//   final String path;
//   final String name;
//   const PageName({required this.name, required this.path});
// }

// class ProfilePageNames {
//   static final infos = PageName(name: "profile_info", path: "/profile/info");
//   static final anime = PageName(name: "profile_last_anime", path: "/profile/profile_last_anime");
//   static final devices = PageName(name: "profile_devices", path: "/profile/devices");
//   static final plans = PageName(name: "profile_plans", path: "/profile/plans");
// }

// List<RouteBase> buildProfileRoutes(bool isMobile) {
//   final routes = [
//     GoRoute(
//       path: ProfilePageNames.infos.path,
//       name: ProfilePageNames.infos.name,
//       pageBuilder: (context, state) => transitionBuilder(const ProfileInfosMenu(), state),
//     ),
//     GoRoute(
//       path: ProfilePageNames.anime.path,
//       name: ProfilePageNames.anime.name,
//       pageBuilder: (context, state) => transitionBuilder(const ProfileLastAnimeMenu(), state),
//     ),
//     GoRoute(
//       path: ProfilePageNames.devices.path,
//       name: ProfilePageNames.devices.name,
//       pageBuilder: (context, state) => transitionBuilder(const ProfileDevicesMenu(), state),
//     ),
//   ];

//   if (isMobile) {
//     return [
//       GoRoute(
//         path: "/profile",
//         pageBuilder: (context, state) => transitionBuilder(
//           ProfilePage(
//             current: state.fullPath ?? ProfilePageNames.infos.path,
//             child: const ProfileInfosMenu(),
//           ),
//           state,
//         ),
//         routes: routes,
//       ),
//     ];
//   }

//   // 🖥 DESKTOP → ProfilePage is WRAPPER
//   return [
//     ShellRoute(
//       builder: (context, state, child) => ProfileProvider(
//         child: ProfilePage(current: state.fullPath ?? ProfilePageNames.infos.path, child: child),
//       ),
//       routes: routes,
//     ),
//   ];
// }
