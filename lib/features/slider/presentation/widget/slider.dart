import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/slider/data/mapper/slider_mapper.dart';
import 'package:application/features/slider/data/models/slider_model.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:application/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:application/features/slider/presentation/bloc/slider_event.dart';
import 'package:application/features/slider/presentation/bloc/slider_state.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final pageController = PageController(initialPage: 0);
  int currentPage = 0;
  double progress = 0;
  Duration duration = Duration(seconds: 10);
  Timer? timer;
  List<SliderEntity> sliders = [];

  void autoPlay() {
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (currentPage == sliders.length - 1) {
          currentPage = 0;
        } else {
          currentPage++;
        }
      });
    });
  }

  void setPage(int page) {
    timer?.cancel();
    setState(() => currentPage = page);
    autoPlay();
  }

  void nextPage() {
    setPage((currentPage + 1) % (sliders.length));
  }

  void slide(DragEndDetails det) {
    if (det.primaryVelocity == null) return;
    if (det.primaryVelocity! < -50) previousPage();
    if (det.primaryVelocity! > 50) nextPage();
  }

  void previousPage() {
    if (currentPage == 0) {
      setPage(sliders.length - 1);
    } else {
      setPage(currentPage - 1);
    }
  }

  @override
  void initState() {
    autoPlay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    return BlocProvider(
      create: (context) => sl<SliderBloc>()..add(GetFullSlider()),
      child: BlocConsumer<SliderBloc, SliderState>(
        listener: (context, state) {
          if (state is SliderSuccess) {
            setState(() => sliders = state.data);
          }
        },
        builder: (context, state) {
          final isLoading = state is! SliderSuccess;
          final h = MediaQuery.of(context).size.height;
          final fake = List.generate(
            4,
            (index) => SliderMapper.modelToEntity(SliderModel(anime: AnimeModel(uz: {"title": lorem(5), "description": lorem()}))),
          );
          final data = isLoading ? fake : state.data;
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: isLoading,
            child: SizedBox(
              height: isMobile ? 370 : h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ...data.asMap().entries.map(
                    (e) => AnimatedOpacity(
                      opacity: e.key == currentPage ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      child: IgnorePointer(ignoring: e.key != currentPage, child: carouselItem(e.value, context)),
                    ),
                  ),
                  if (!isMobile)
                    Material(
                      type: MaterialType.transparency,
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        crossAxisAlignment: .stretch,
                        children: [
                          InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            onTap: previousPage,
                            child: SizedBox(width: 100, child: Icon(Icons.keyboard_arrow_left)),
                          ),
                          InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            onTap: nextPage,
                            child: SizedBox(width: 100, child: Icon(Icons.keyboard_arrow_right)),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget carouselItem(SliderEntity e, BuildContext context) => LayoutBuilder(
    builder: (context, consts) {
      final isMobile = consts.maxWidth < MOBILE_WIDTH;
      return GestureDetector(
        onHorizontalDragEnd: slide,
        onTap: () => context.pushNamed("anime", pathParameters: {"type": e.anime.type, "slug": e.anime.slug}),
        child: Container(
          decoration: BoxDecoration(
            image: e.image.isEmpty ? null : DecorationImage(image: CachedNetworkImageProvider(e.image), fit: BoxFit.cover),
            color: e.image.isEmpty ? context.appColors.surface : null,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 30 : 100, vertical: isMobile ? 10 : 90),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [context.appColors.surface, Colors.transparent],
                begin: isMobile ? .bottomCenter : .topStart,
                end: isMobile ? .center : .center,
              ),
            ),
            child: Row(
              crossAxisAlignment: .end,
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Expanded(child: Container()),
                      Text("${e.anime.title.uz} [${e.anime.age}+]", style: isMobile ? context.textTheme.titleLarge : context.textTheme.displayMedium),
                      SizedBox(
                        width: 500,
                        child: Text(
                          e.anime.description.uz,
                          maxLines: isMobile ? 2 : 4,
                          overflow: TextOverflow.ellipsis,
                          style: isMobile ? context.textTheme.bodyMedium : context.textTheme.bodyLarge,
                        ),
                      ),

                      if (!isMobile) ...[
                        SizedBox(height: 10),
                        Row(
                          spacing: 10,
                          children: [
                            FilledButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.play_arrow),
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                                fixedSize: WidgetStatePropertyAll(Size(150, 40)),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
                              ),
                              label: Text("Tomosha qilish"),
                            ),
                            IconButton.outlined(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.bookmark_outline),
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                                fixedSize: WidgetStatePropertyAll(Size(40, 40)),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: isMobile ? 10 : 100),
                      Row(
                        crossAxisAlignment: .end,
                        mainAxisAlignment: isMobile ? .center : .start,
                        spacing: 10,
                        children: sliders.asMap().entries.map((e) {
                          final isCurrent = e.key == currentPage;
                          final double radius = isMobile ? 9 : 12;
                          return InkWell(
                            onTap: () => setPage(e.key),
                            mouseCursor: SystemMouseCursors.click,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: isCurrent ? context.appColors.primaryContainer : context.appColors.primary,
                              ),
                              width: isCurrent ? radius * 8 : radius * 2,
                              height: radius,
                              clipBehavior: Clip.antiAlias,
                              alignment: AlignmentGeometry.centerStart,
                              child: AnimatedContainer(
                                curve: Curves.linear,
                                duration: isCurrent ? (duration + Durations.medium1) : Duration(seconds: 0),
                                width: isCurrent ? radius * 8 : 0,
                                height: double.infinity,
                                child: Container(color: context.appColors.primary),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                if (!(consts.maxWidth < 1000) && e.mobileImage.isNotEmpty)
                  CachedNetworkImage(imageUrl: addBaseUrl(e.mobileImage), height: 500, width: 300, fit: .cover),
                if (e.mobileImage.isEmpty) Container(height: 500, width: 300, color: context.appColors.primary),
              ],
            ),
          ),
        ),
      );
    },
  );
}
