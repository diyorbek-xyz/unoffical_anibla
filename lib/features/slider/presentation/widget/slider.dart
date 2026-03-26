import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:application/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:application/features/slider/presentation/bloc/slider_event.dart';
import 'package:application/features/slider/presentation/bloc/slider_state.dart';
import 'package:application/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SliderBloc>()..add(GetFullSlider()),
      child: BlocBuilder<SliderBloc, SliderState>(
        builder: (context, state) {
          if (state is SliderLoading) {
            return SizedBox(
              width: 100,
              height: 100,
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          }
          if (state is SliderError) {
            return SizedBox(
              width: 100,
              height: 100,
              child: Center(child: Text(state.exception.toString())),
            );
          }
          if (state is SliderSuccess) {
            return SliderWidget(items: state.data, animationDuration: Duration(milliseconds: 400));
          }
          return Text('data');
        },
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  final Duration autoPlaySpeed;
  final Duration animationDuration;
  final List<SliderEntity> items;
  const SliderWidget({
    super.key,
    this.autoPlaySpeed = const Duration(seconds: 5),
    this.animationDuration = const Duration(milliseconds: 200),
    this.items = const [],
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void nextPage() {
    setIndex((currentIndex + 1) % widget.items.length);
  }

  void autoPlay() async {
    while (mounted) {
      await Future.delayed(widget.autoPlaySpeed);
      nextPage();
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, autoPlay);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.animationDuration,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      layoutBuilder: (currentChild, previousChildren) {
        List<MapEntry<int, dynamic>> indicator = widget.items.asMap().entries.toList();
        return Stack(
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            currentChild ?? Placeholder(),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: indicator
                    .map(
                      (e) => InkWell(
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () => setIndex(e.key),
                        borderRadius: BorderRadius.circular(10),
                        child: AnimatedContainer(
                          duration: widget.animationDuration,
                          width: e.key == currentIndex ? 35 : 20,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: e.key == currentIndex
                                ? context.appColors.primary
                                : context.appColors.primary.withAlpha(40),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
      child: Container(
        key: ValueKey(currentIndex),
        width: double.infinity,
        height: 500,
        color: context.appColors.surface,
        child: sliderItem(widget.items[currentIndex]),
      ),
    );
  }

  Widget sliderItem(SliderEntity entity) {
    final colorScheme = ColorScheme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(entity.image)),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, colorScheme.surface.withValues(alpha: 0.95)],
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                "${entity.anime['uz']['title']} [${entity.anime['age']}+]",
                style: TextStyle(fontSize: 32, color: context.appColors.onSurface),
              ),
              Text(
                entity.anime['uz']['description'],
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: context.appColors.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
