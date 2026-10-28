import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/features/anibla/presentation/controllers/slider_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/shared/widgets/image.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

class _CarouselState extends State<Carousel> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  static const _interval = Duration(seconds: 10);
  static const _fade = Duration(milliseconds: 600);

  @override
  bool get wantKeepAlive => true;

  Timer? _timer;
  bool _fading = false;
  int _current = 0;
  int _previous = 0;
  final _controller = sl<SliderController>();

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(_interval, (_) => _next());
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  bool _busy = false; // true from tap until fade finishes

  late final _anim = AnimationController(vsync: this, duration: _fade, value: 1)
    ..addStatusListener((s) {
      if (s == AnimationStatus.completed && mounted) {
        setState(() {
          _fading = false;
          _busy = false;
        });
      }
    });

  late final _opacity = CurvedAnimation(parent: _anim, curve: Curves.easeInOut);

  @override
  void dispose() {
    _timer?.cancel();
    _opacity.dispose();
    _anim.dispose();
    super.dispose();
  }

  void _goTo(int page, List<CarouselItem> data) {
    if (data.length <= 1 || page == _current || _busy) return;
    _busy = true;
    if (!mounted) return;
    _anim.value = 0;
    setState(() {
      _previous = _current;
      _current = page;
      _fading = true;
    });
    _anim.forward();
    _startTimer();
  }

  void _next() {
    final data = _controller.sliderSignal.value.value ?? const <CarouselItem>[];
    if (data.isEmpty) return;
    _goTo((_current + 1) % data.length, data);
  }

  void _prev() {
    final data = _controller.sliderSignal.value.value ?? const <CarouselItem>[];
    if (data.isEmpty) return;
    _goTo((_current - 1 + data.length) % data.length, data);
  }

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
        if (state.hasError) {
          return ErrorBuilder(message: (state.error as Failure).message, refresh: _controller.refresh);
        }
        final data = state.value ?? _controller.fakeSlider;
        return Skeletonizer(enableSwitchAnimation: true, enabled: state.isLoading, child: _slides(data, isMobile));
      },
    );
  }

  Widget _layer(List<CarouselItem> data, int index, Animation<double> opacity) => KeyedSubtree(
    key: ValueKey(index),
    child: FadeTransition(
      opacity: opacity,
      child: RepaintBoundary(child: carouselItem(data[index], context)),
    ),
  );

  Widget _slides(List<CarouselItem> data, bool isMobile) {
    if (data.isEmpty) return const SizedBox.shrink();
    final cur = _current.clamp(0, data.length - 1);
    final prev = _previous.clamp(0, data.length - 1);

    return GestureDetector(
      onHorizontalDragEnd: _onDrag,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_fading && prev != cur) IgnorePointer(child: _layer(data, prev, kAlwaysCompleteAnimation)),
          _layer(data, cur, _opacity),
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

  ButtonStyle _buttonStyle(BuildContext context, Size size) => ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(context.appColors.primary),
    foregroundColor: WidgetStatePropertyAll(context.appColors.onPrimary),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    fixedSize: WidgetStatePropertyAll(size),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    side: WidgetStateProperty.fromMap({
      WidgetState.selected | WidgetState.focused | WidgetState.hovered: BorderSide(width: 3, color: context.appColors.secondary),
    }),
  );

  Widget carouselItem(CarouselItem item, BuildContext context) => LayoutBuilder(
    builder: (context, consts) {
      final isMobile = consts.maxWidth < MOBILE_WIDTH;
      final showSideImage = !isMobile && consts.maxWidth >= 1000;

      return DecoratedBox(
        decoration: BoxDecoration(
          image: item.image.isEmpty ? null : DecorationImage(image: CachedNetworkImageProvider(item.image), fit: BoxFit.cover),
          color: item.image.isEmpty ? context.appColors.surface : null,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 100, vertical: isMobile ? 10 : 90),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [context.appColors.surface, Colors.transparent],
              begin: isMobile ? Alignment.bottomCenter : Alignment.topLeft,
              end: Alignment.center,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: isMobile ? MainAxisAlignment.end : MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      "${item.anime.title.uz} [${item.anime.age}+]",
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
                      const SizedBox(height: 10),
                      Row(
                        spacing: 10,
                        children: [
                          FilledButton.icon(
                            onPressed: () =>
                                context.pushNamed("media", queryParameters: MediaProps.fromAnime(item.anime).toJson()),
                            icon: const Icon(Icons.play_arrow),
                            style: _buttonStyle(context, const Size(150, 40)),
                            label: const Text("Tomosha qilish"),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_outline),
                            style: _buttonStyle(context, const Size(40, 40)),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (showSideImage)
                item.mobileImage.isNotEmpty
                    ? SafeImage(imageUrl: addBaseUrl(item.mobileImage), height: 500, width: 300, fit: BoxFit.cover)
                    : Container(height: 500, width: 300, color: context.appColors.primary),
            ],
          ),
        ),
      );
    },
  );
}
