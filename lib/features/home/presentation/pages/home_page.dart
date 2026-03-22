import 'package:application/features/calendar/presentation/widget/calendar.dart';
import 'package:application/features/slider/presentation/widget/slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselWidget(),
          Calendar(),
          ElevatedButton(onPressed: () => context.pushNamed("login"), child: Text("Login")),
        ],
      ),
    );
  }
}
