import 'package:application/boxes/boxes.dart';
import 'package:application/constants/colors.dart';
import 'package:application/hive_registrar.g.dart';
import 'package:application/main/pages/anime.dart';
import 'package:application/main/views.dart';
import 'package:application/models/anime.dart';
import 'package:application/models/category.dart';
import 'package:application/models/filtered.dart';
import 'package:application/services/animes.dart';
import 'package:application/services/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  Hive.registerAdapters();
  // await Hive.deleteBoxFromDisk("animesBox");
  // await Hive.deleteBoxFromDisk("carouselBox");
  // await Hive.deleteBoxFromDisk("categoriesBox");
  // await Hive.deleteBoxFromDisk("genresBox");
  // await Hive.deleteBoxFromDisk("categoryFilteredBox");

  animesBox = await Hive.openBox<Anime>("animesBox");
  carouselBox = await Hive.openBox<Anime>("carouselBox");
  categoriesBox = await Hive.openBox<Category>("categoriesBox");
  genresBox = await Hive.openBox<Genre>("genresBox");
  categoryFilteredBox = await Hive.openBox<CategoryFiltered>("categoryFilteredBox");
  await FetchAnimes().getAll();
  await FetchCarousel().get();
  await FetchCategories().get();
  await FetchGenres().get();

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
      path: '/anime/:id',
      builder: (context, state) {
        String id = state.pathParameters["id"] ?? "";
        return AnimePage(key: ValueKey(id), id: id);
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
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryDark,
          onPrimary: Colors.white,
          secondary: Colors.green,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
    );
  }
}
