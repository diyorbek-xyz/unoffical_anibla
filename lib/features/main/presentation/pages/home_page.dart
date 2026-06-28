import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/calendar/presentation/widget/calendar.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/main/presentation/widgets/recommends.dart';
import 'package:application/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:application/features/slider/presentation/widget/slider.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SliderBloc>()..add(.getFull())),
        BlocProvider(create: (context) => sl<AnimeBloc>()),
      ],
      child: LayoutBuilder(
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
                    ? SliverToBoxAdapter(
                        child: SizedBox(height: 400, child: Carousel()),
                      )
                    : SliverFillViewport(
                        delegate: SliverChildListDelegate([Carousel()]),
                      ),
                SliverToBoxAdapter(child: Calendar()),
                AnimeRecommends(),
              ],
            ),
          );
        },
      ),
    );
  }
}
