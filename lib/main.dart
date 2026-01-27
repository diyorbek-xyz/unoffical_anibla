import 'package:application/constants/colors.dart';
import 'package:application/main/pages/anime.dart';
import 'package:application/main/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  runApp(const MainApp());
}

int parseString(String str) {
  try {
    int integer = int.parse(str);
    return integer;
  } catch (err) {
    return 0;
  }
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
