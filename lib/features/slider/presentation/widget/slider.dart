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
import 'package:application/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final pageController = PageController(initialPage: 0);
  int currentPage = 0;
  double progress = 0;
  Duration duration = Duration(seconds: 10);
  Timer? timer;
  List<SliderEntity> sliders = [];

  void autoPlay() {
    timer = Timer.periodic(duration, (timer) {
      if (!mounted) return;
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
    setPage((currentPage + 1) % (sliders.isNotEmpty ? sliders.length : 1));
  }

  void slide(DragEndDetails det) {
    if (det.primaryVelocity == null) return;
    if (det.primaryVelocity! < -50) nextPage();
    if (det.primaryVelocity! > 50) previousPage();
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
    super.build(context);
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    return BlocConsumer<SliderBloc, SliderState>(
      listener: (context, state) {
        state.whenOrNull(success: (value) => setState(() => sliders = value));
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            final h = MediaQuery.of(context).size.height;
            final fakeSlider = SliderModel(anime: AnimeModel(uz: {"title": lorem(5), "description": lorem()}));
            final fake = List.generate(4, (index) => SliderMapper.modelToEntity(fakeSlider));
            return Skeletonizer(enableSwitchAnimation: true, enabled: true, child: sliderBuilder(isMobile, h, fake, context));
          },
          success: (data) {
            final h = MediaQuery.of(context).size.height;
            return sliderBuilder(isMobile, h, data, context);
          },
          orElse: () => Text("Nimadur xato ketti"),
        );
      },
    );
  }

  Widget sliderBuilder(bool isMobile, double h, List<dynamic> data, BuildContext context) {
    return FocusTraversalGroup(
      policy: ReadingOrderTraversalPolicy(),
      child: GestureDetector(
        onHorizontalDragEnd: slide,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ...data.asMap().entries.map(
              (e) => AnimatedOpacity(
                opacity: e.key == currentPage ? 1 : 0,
                curve: Easing.legacy,
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
  }

  Widget carouselItem(SliderEntity e, BuildContext context) => LayoutBuilder(
    builder: (context, consts) {
      final isMobile = consts.maxWidth < MOBILE_WIDTH;
      return Container(
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
                  mainAxisAlignment: isMobile ? .end : .center,
                  spacing: 10,
                  children: [
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
                              backgroundColor: WidgetStateProperty.fromMap({
                                WidgetState.focused: context.appColors.primaryContainer,
                                WidgetState.any: context.appColors.primary,
                              }),
                              foregroundColor: WidgetStateProperty.fromMap({
                                WidgetState.focused: context.appColors.onPrimaryContainer,
                                WidgetState.any: context.appColors.onPrimary,
                              }),
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
                              backgroundColor: WidgetStateProperty.fromMap({
                                WidgetState.focused: context.appColors.primaryContainer,
                                WidgetState.any: context.appColors.primary,
                              }),
                              foregroundColor: WidgetStateProperty.fromMap({
                                WidgetState.focused: context.appColors.onPrimaryContainer,
                                WidgetState.any: context.appColors.onPrimary,
                              }),
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              fixedSize: WidgetStatePropertyAll(Size(40, 40)),
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: .circular(5))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (!(consts.maxWidth < 1000) && e.mobileImage.isNotEmpty && !isMobile)
                CachedNetworkImage(imageUrl: addBaseUrl(e.mobileImage), height: 500, width: 300, fit: .cover),
              if (e.mobileImage.isEmpty && !isMobile) Container(height: 500, width: 300, color: context.appColors.primary),
            ],
          ),
        ),
      );
    },
  );
}

class _DotIndicator extends StatefulWidget {
  const _DotIndicator({required this.isCurrent, required this.radius, required this.onTap});

  final bool isCurrent;
  final double radius;
  final VoidCallback onTap;

  @override
  State<_DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<_DotIndicator> {
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      mouseCursor: SystemMouseCursors.click,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onFocusChange: (focused) => setState(() => _hasFocus = focused),
      canRequestFocus: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: _hasFocus ? Border.all(width: 1, color: context.appColors.surface) : null,
        ),
        child: AnimatedContainer(
          curve: Easing.legacy,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: widget.isCurrent ? context.appColors.primaryContainer : context.appColors.primary,
          ),
          width: widget.isCurrent ? widget.radius * 8 : widget.radius * 2,
          height: widget.radius,
          clipBehavior: Clip.antiAlias,
          alignment: AlignmentGeometry.centerStart,
          child: AnimatedContainer(
            curve: Curves.linear,
            duration: widget.isCurrent ? (const Duration(seconds: 10) + Durations.medium1) : Duration.zero,
            width: widget.isCurrent ? widget.radius * 8 : 0,
            height: double.infinity,
            child: Container(color: context.appColors.primary),
          ),
        ),
      ),
    );
  }
}
