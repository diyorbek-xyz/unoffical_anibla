import 'package:application/core/constants/theme.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/pages/anime.dart';
import 'package:application/presentation/pages/login.dart';
import 'package:application/presentation/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  await Hive.deleteBoxFromDisk("animesBox");
  await Hive.deleteBoxFromDisk("carouselBox");
  await Hive.deleteBoxFromDisk("categoriesBox");
  await Hive.deleteBoxFromDisk("genresBox");
  await Hive.deleteBoxFromDisk("calendarBox");

  // animesBox = await Hive.openBox<AnimeModel>("animesBox");
  // carouselBox = await Hive.openBox<CarouselItemModel>("carouselBox");
  // calendarBox = await Hive.openBox<CalendarModel>("calendarBox");
  // categoriesBox = await Hive.openBox<CategoryModel>("categoriesBox");
  // genresBox = await Hive.openBox<GenreModel>("genresBox");
  // searchBox = await Hive.openBox<AnimeModel>("searchBox");

  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: "view",
      path: "/view",
      builder: (context, state) {
        return const Views();
      },
    ),
    GoRoute(
      name: 'anime',
      path: '/anime/:slug',
      builder: (context, state) {
        final String slug = state.pathParameters["slug"] ?? "";
        final String type = state.uri.queryParameters['type'] ?? "";
        return AnimePage(key: ValueKey(slug), slug: slug, type: type);
      },
    ),
    GoRoute(
      name: "login",
      path: "/",
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
    return MaterialApp.router(routerConfig: _router, debugShowCheckedModeBanner: false, theme: themeData);
  }
}
