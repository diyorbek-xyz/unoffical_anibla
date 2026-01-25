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

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const Views();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'anime/:id',
          builder: (context, state) => AnimePage(id: state.pathParameters["id"] ?? ""),
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router, debugShowCheckedModeBanner: false);
  }
}
