import 'package:application/features/calendar/presentation/widget/calendar.dart';
import 'package:application/features/slider/presentation/widget/slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 600,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 9,child: CarouselWidget()),
            Expanded(flex: 4,child: Calendar()),
          ],
        ),
      ),
    );
  }
}
