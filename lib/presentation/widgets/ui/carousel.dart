import 'package:application/core/constants/theme.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_bloc.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_state.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

const double _breakpointDesktop = 1000;
const double _breakpointTablet = 700;
const double _breakpointMobile = 500;

class WidgetCarousel extends StatefulWidget {
  const WidgetCarousel({super.key});

  @override
  State<WidgetCarousel> createState() => _WidgetCarouselState();
}

class _WidgetCarouselState extends State<WidgetCarousel> {
  late final _controller = CarouselSliderController();

  late final ButtonStyle _arrowButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(primaryTint),
    foregroundColor: WidgetStatePropertyAll(primaryDark),
  );

  static const _gradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black87, Colors.transparent]),
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<RemoteCarouselBloc, RemoteCarouselState>(
      builder: (context, state) {
        if (state is RemoteCarouselFailed) {
          return Center(child: Text(state.exception.toString()));
        }
        return Skeletonizer(
          enabled: state is RemoteCarouselLoading,
          effect: const PulseEffect(from: Colors.white, to: Colors.white10),
          enableSwitchAnimation: true,
          child: Stack(
            fit: StackFit.expand,
            children: [
              _carouselSlider(state, context, state is RemoteCarouselLoading),
              if (width > _breakpointTablet)
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 10,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton.filled(
                      onPressed: () => _controller.nextPage(),
                      style: _arrowButtonStyle,
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ),
              if (width > _breakpointTablet)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => _controller.previousPage(),
                      style: _arrowButtonStyle,
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _carouselSlider(RemoteCarouselState state, BuildContext context, bool loading) {
    if (loading) {
      return Skeleton.replace(replace: true, child: animeInfo(AnimeUiModel.fromEntity(AnimeEntity())));
    }

    final items = state.carouselItemList;
    if (items == null || items.isEmpty) {
      return const SizedBox.shrink();
    }

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        pageSnapping: true,
        height: double.infinity,
        clipBehavior: Clip.hardEdge,
      ),
      carouselController: _controller,
      disableGesture: true,
      items: items.map((item) {
        return _carouselItem(context, item);
      }).toList(),
    );
  }

  Widget _carouselItem(BuildContext context, dynamic item) {
    return InkWell(
      mouseCursor: WidgetStateMouseCursor.clickable,
      splashColor: primaryTint.withValues(alpha: 0.1),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => context.pushNamed('anime', pathParameters: {"slug": item.anime.slug}),
      child: Ink.image(
        image: CachedNetworkImageProvider(item.image),
        width: double.infinity,
        fit: BoxFit.cover,
        child: animeInfo(item.anime),
      ),
    );
  }

  Widget animeInfo(AnimeUiModel anime) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > _breakpointDesktop;
    final isTablet = width > _breakpointTablet;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (isDesktop) Positioned(bottom: 20, right: 20, child: _buildProgressIndicator()),
        Ink(
          decoration: _gradientBoxDecoration,
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 50 : 20, vertical: isDesktop ? 100 : 50),
          child: Column(
            crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 20,
            children: [_buildTitleWidget(anime, width, isDesktop), if (isTablet) _buildDescriptionWidget(anime, isDesktop)],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleWidget(AnimeUiModel anime, double width, bool isDesktop) {
    final fontSize = isDesktop ? 35.0 : (width > _breakpointMobile ? 25.0 : 35.0);

    return Text(
      "${anime.title.uz} ${anime.age}+",
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _buildDescriptionWidget(AnimeUiModel anime, bool isDesktop) {
    return Text(
      anime.description.uz,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: isDesktop ? 17.0 : 13.0, color: Colors.white),
    );
  }

  Widget _buildProgressIndicator() {
    return RepaintBoundary(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 4, milliseconds: 800),
        builder: (context, value, _) {
          return CircularProgressIndicator(
            value: value,
            strokeAlign: -1,
            strokeWidth: 20,
            backgroundColor: primary.withValues(alpha: 0.1),
            valueColor: AlwaysStoppedAnimation(primary.withValues(alpha: 0.3)),
          );
        },
      ),
    );
  }
}
