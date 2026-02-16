import 'package:application/core/constants/colors.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_bloc.dart';
import 'package:application/presentation/bloc/carousel/remote/remote_carousel_state.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WidgetCarousel extends StatefulWidget {
  const WidgetCarousel({super.key});

  @override
  State<WidgetCarousel> createState() => _WidgetCarouselState();
}

class _WidgetCarouselState extends State<WidgetCarousel> {
  final _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final arrowButtonStyle = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryTint),
      foregroundColor: WidgetStatePropertyAll(primaryDark),
    );
    return BlocBuilder<RemoteCarouselBloc, RemoteCarouselState>(
      builder: (context, state) {
        if (state is RemoteCarouselFailed) {
          return Center(child: Text(state.exception.toString()));
        }
        final width = MediaQuery.of(context).size.width;
        return Stack(
          fit: StackFit.expand,
          children: [
            _carouselSlider(state, context),
            if (width > 700)
              Positioned(
                top: 0,
                bottom: 0,
                right: 10,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton.filled(
                    onPressed: () => _controller.nextPage(),
                    style: arrowButtonStyle,
                    icon: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),
            if (width > 700)
              Positioned(
                top: 0,
                bottom: 0,
                left: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => _controller.previousPage(),
                    style: arrowButtonStyle,
                    icon: Icon(Icons.keyboard_arrow_left),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  CarouselSlider _carouselSlider(RemoteCarouselState state, BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 5),
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        pageSnapping: true,
        height: double.infinity,
        clipBehavior: Clip.hardEdge,
      ),
      carouselController: _controller,
      disableGesture: true,
      items: state.carouselItemList?.map((item) {
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
      }).toList(),
    );
  }

  Widget animeInfo(AnimeUiModel anime) {
    final boxDecoration = BoxDecoration(
      gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black87, Colors.transparent]),
    );
    final width = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      children: [
        if (width > 1000)
          Positioned(
            bottom: 20,
            right: 20,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 4, milliseconds: 800),
              builder: (context, value, _) {
                return CircularProgressIndicator(
                  value: value,
                  strokeAlign: -1,
                  strokeWidth: 20,
                  backgroundColor: primaryTint,
                  valueColor: AlwaysStoppedAnimation(primary),
                );
              },
            ),
          ),
        Ink(
          decoration: boxDecoration,
          padding: EdgeInsets.symmetric(horizontal: width > 500 ? 50 : 20, vertical: width > 1000 ? 100 : 50),
          child: Column(
            crossAxisAlignment: width > 1000 ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
            mainAxisAlignment: width > 1000 ? MainAxisAlignment.end : MainAxisAlignment.end,
            spacing: 20,
            children: [
              Text(
                "${anime.title.uz} ${anime.age}+",
                style: TextStyle(
                  fontSize: width > 1000
                      ? 35
                      : width > 500
                      ? 25
                      : 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (width > 500)
                Text(
                  anime.description.uz,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: width > 1000 ? 17 : 13, color: Colors.white),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
