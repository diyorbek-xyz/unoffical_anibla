import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/features/anibla/presentation/controllers/slider_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/shared/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:application/features/anibla/data/models/data/carousel_item.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with AutomaticKeepAliveClientMixin {
  static const _interval = Duration(seconds: 10);
  static const _fade = Duration(milliseconds: 600);

  @override
  bool get wantKeepAlive => true;

  final _controller = sl<SliderController>();
  Timer? _timer;
  int _current = 0;
  int _previous = 0;

  int get _length => _controller.sliderSignal.value.value?.length ?? 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(_interval, (_) => _next());
  }

  void _goTo(int page) {
    if (_length <= 1) return;
    setState(() => (_previous = _current, _current = page));
    _startTimer();
  }

  void _next() => _length < 0 ? null : _goTo((_current + 1) % _length);
  void _prev() => _length < 0 ? null : _goTo((_current - 1 + _length) % _length);

  void _onDrag(DragEndDetails d) {
    final v = d.primaryVelocity ?? 0;
    if (v < -50) _next();
    if (v > 50) _prev();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isMobile = MediaQuery.sizeOf(context).width < MOBILE_WIDTH;

    return SignalBuilder(
      builder: (context) {
        final state = _controller.sliderSignal.value;
        if (state.hasError) return ErrorBuilder(message: (state.error as Failure).message, refresh: _controller.refresh);
        final data = state.value ?? _controller.fakeSlider;
        return Skeletonizer(enableSwitchAnimation: true, enabled: state.isLoading, child: _slides(data, isMobile));
      },
    );
  }

  Widget _slides(List<CarouselItem> data, bool isMobile) {
    if (data.isEmpty) return const SizedBox.shrink();
    final cur = _current.clamp(0, data.length - 1);
    final prev = _previous.clamp(0, data.length - 1);

    return GestureDetector(
      onHorizontalDragEnd: _onDrag,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (prev != cur) IgnorePointer(child: carouselItem(data[prev], context)),

          TweenAnimationBuilder<double>(
            key: ValueKey(cur),
            tween: Tween(begin: 0, end: 1),
            duration: _fade,
            curve: Curves.easeInOut,
            builder: (_, v, child) => Opacity(opacity: v, child: child),
            child: carouselItem(data[cur], context),
          ),

          if (!isMobile) _arrows(),
        ],
      ),
    );
  }

  Widget _arrows() => Material(
    type: MaterialType.transparency,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: _prev,
          child: const SizedBox(width: 100, child: Icon(Icons.keyboard_arrow_left)),
        ),
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: _next,
          child: const SizedBox(width: 100, child: Icon(Icons.keyboard_arrow_right)),
        ),
      ],
    ),
  );

  Widget carouselItem(CarouselItem item, BuildContext context) => LayoutBuilder(
    builder: (context, consts) {
      final isMobile = consts.maxWidth < MOBILE_WIDTH;
      return DecoratedBox(
        decoration: BoxDecoration(
          image: item.image.isEmpty ? null : DecorationImage(image: imageProviderFallback(item.image), fit: BoxFit.cover),
          color: item.image.isEmpty ? context.appColors.surface : null,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 100, vertical: isMobile ? 10 : 90),
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
                    Text(
                      "${item.anime.title.uz.toString()} [${item.anime.age}+]",
                      style: isMobile ? context.textTheme.titleLarge : context.textTheme.displayMedium,
                    ),
                    SizedBox(
                      width: 500,
                      child: Text(
                        item.anime.description.uz,
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
                            onPressed: () =>
                                context.pushNamed("media", queryParameters: MediaProps.fromAnime(item.anime).toJson()),
                            icon: Icon(Icons.play_arrow),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(context.appColors.primary),
                              foregroundColor: WidgetStatePropertyAll(context.appColors.onPrimary),
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              fixedSize: WidgetStatePropertyAll(Size(150, 40)),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
                              ),
                              side: WidgetStateProperty.fromMap({
                                WidgetState.selected | WidgetState.focused | WidgetState.hovered: BorderSide(
                                  width: 3,
                                  color: context.appColors.secondary,
                                ),
                              }),
                            ),
                            label: Text("Tomosha qilish"),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.bookmark_outline),
                            style: ButtonStyle(
                              side: WidgetStateProperty.fromMap({
                                WidgetState.selected | WidgetState.focused | WidgetState.hovered: BorderSide(
                                  width: 3,
                                  color: context.appColors.secondary,
                                ),
                              }),
                              backgroundColor: WidgetStatePropertyAll(context.appColors.primary),
                              foregroundColor: WidgetStatePropertyAll(context.appColors.onPrimary),
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
              if (!(consts.maxWidth < 1000) && item.mobileImage.isNotEmpty && !isMobile)
                SafeImage(imageUrl: addBaseUrl(item.mobileImage), height: 500, width: 300, fit: .cover),
              if (item.mobileImage.isEmpty && !isMobile) Container(height: 500, width: 300, color: context.appColors.primary),
            ],
          ),
        ),
      );
    },
  );
}
