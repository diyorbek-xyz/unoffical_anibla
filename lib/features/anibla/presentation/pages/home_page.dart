import 'package:application/features/anibla/presentation/widgets/calendar.dart';
import 'package:application/shared/widgets/responsive.dart';
import 'package:application/features/anibla/presentation/widgets/recommends.dart';
import 'package:application/features/anibla/presentation/widgets/slider.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, consts) {
        final isMobile = consts.maxWidth < MOBILE_WIDTH;
        return Responsive(
          constraints: consts,
          mobileWidth: MOBILE_WIDTH,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
            slivers: [
              isMobile
                  ? SliverToBoxAdapter(child: SizedBox(height: 400, child: Carousel()))
                  : SliverFillViewport(delegate: SliverChildListDelegate([Carousel()])),
              SliverToBoxAdapter(child: Calendar()),
              AnimeRecommends(),
            ],
          ),
        );
      },
    );
  }
}
