
import 'package:application/core/constants/colors.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/pages/anime.dart';
import 'package:application/presentation/pages/tracemoe.dart';
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
      path: "/",
      builder: (context, state) {
        return const Views();
      },
    ),
    GoRoute(
      name: 'anime',
      path: '/anime/:slug',
      builder: (context, state) {
        String slug = state.pathParameters["slug"] ?? "";
        return AnimePage(key: ValueKey(slug), slug: slug);
      },
    ),
    GoRoute(name: 'trace', path: '/tracemoe', builder: (context, state) => TraceMoePage()),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryDark,
          onPrimary: Colors.white,
          secondary: Colors.green,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFF202028),
          onSurface: Colors.white,
        ),
      ),
    );
  }
}
