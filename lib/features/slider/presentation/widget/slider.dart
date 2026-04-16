import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/slider/domain/entities/slider_entity.dart';
import 'package:application/features/slider/presentation/bloc/slider_bloc.dart';
import 'package:application/features/slider/presentation/bloc/slider_event.dart';
import 'package:application/features/slider/presentation/bloc/slider_state.dart';
import 'package:application/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
              height: 500,
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          }
          if (state is SliderError) {
            return SizedBox(
              height: 500,
              child: ErrorBuilder(
                message: state.message,
                refresh: () => context.read<SliderBloc>().add(GetFullSlider()),
              ),
            );
          }
          if (state is SliderSuccess) {
            return Carousel(items: state.data);
          }
          return Text('data');
        },
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  final List<SliderEntity> items;
  const Carousel({super.key, required this.items});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final carouselWidth = constraints.maxWidth;
        final weights = carouselWidth > 500 ? [1, 5, 1] : [1];
        final height = carouselWidth > 500 ? 600.0 : 400.0;
        return SizedBox(
          height: height,
          child: CarouselView.weighted(
            elevation: 1,
            flexWeights: weights,
            itemSnapping: true,
            enableSplash: true,
            controller: _controller,
            onTap: (value) {
              final anime = widget.items.elementAt(value).anime;
              context.pushNamed(
                "anime",
                pathParameters: {"type": anime.type, "slug": anime.slug},
              );
            },
            children: widget.items.map((e) {
              return Ink.image(
                image: CachedNetworkImageProvider(e.image),
                fit: BoxFit.cover,
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [context.appColors.surface, Colors.transparent],
                      begin: AlignmentGeometry.bottomCenter,
                      end: AlignmentGeometry.center,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constrains) {
                      final itemWidth = constrains.maxWidth;
                      final opacity = (carouselWidth / 2) > (itemWidth)
                          ? 0.0
                          : 1.0;
                      final hidden = ((carouselWidth - 100) / 2) > itemWidth
                          ? false
                          : true;
                      return AnimatedOpacity(
                        opacity: opacity,
                        duration: Duration(milliseconds: 200),
                        child: hidden
                            ? Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    e.anime.title.uz,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    e.anime.description.uz,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              )
                            : Container(),
                      );
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
