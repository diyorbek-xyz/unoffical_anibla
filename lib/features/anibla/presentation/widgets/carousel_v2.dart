import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/data/carousel_item.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/presentation/controllers/slider_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:flutter_space/flutter_space.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarouselV2 extends StatefulWidget {
  const CarouselV2({super.key});

  @override
  State<CarouselV2> createState() => _CarouselV2State();
}

class _CarouselV2State extends State<CarouselV2> {
  late final _controller = sl<SliderController>();
  late final _carouselController = CarouselController();
  EffectCleanup? _effectCleanup;
  Timer? _cleanUp;

  @override
  void initState() {
    super.initState();
    _effectCleanup = effect(() {
      final len = _controller.sliderSignal.value.value?.length;
      if (len == null || (_cleanUp != null || !mounted)) return;
      _cleanUp = Timer.periodic(Duration(seconds: 6), (timer) {
        if (!mounted) return;
        final current = _carouselController.leadingItem;
        final newI = current < (len - 1) ? current + 1 : 0;
        _carouselController.animateToItem(newI, curve: Curves.easeOut, duration: Durations.medium4);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cleanUp?.cancel();
    _effectCleanup?.call();
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final state = _controller.sliderSignal.value;
      if (state.hasError) return ErrorBuilder(message: state.error.toString(), refresh: _controller.refresh);
      final data = state.value ?? _controller.fakeSlider;
      return Skeletonizer(
        enabled: state.isLoading,
        enableSwitchAnimation: true,
        child: CarouselView.weighted(
          controller: _carouselController,
          flexWeights: [1],
          infinite: true,
          itemSnapping: true,
          enableSplash: false,
          shrinkExtent: 720,
          shape: RoundedRectangleBorder(borderRadius: .circular(20)),
          padding: .only(right: 5),
          backgroundColor: context.colors.surfaceContainer,
          children: data.map(_item).toList(),
        ),
      );
    },
  );

  Widget _item(CarouselItem e) => Ink.image(
    image: imageProviderFallback((e.image)),
    alignment: .center,
    fit: .cover,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.black54, Colors.transparent], begin: .centerStart, end: .center),
      ),
      padding: .all(30),
      alignment: .centerStart,
      child: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Text(e.anime.title.uz, style: context.textTheme.displayLarge?.copyWith(fontWeight: .bold), maxLines: 2),
            Space(10),
            Text(e.anime.description.uz, style: context.textTheme.bodyLarge, maxLines: 4),
            Space(50),
            Row(
              spacing: 10,
              children: [
                FilledButton(
                  onPressed: () => context.pushNamed("media", queryParameters: MediaProps.fromAnime(e.anime).toJson()),
                  child: const Text("Tomosha qilish"),
                ),
                OutlinedButton(onPressed: () {}, child: const Icon(Icons.bookmark_outline)),
                OutlinedButton(onPressed: () {}, child: const Icon(Icons.share_outlined)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
