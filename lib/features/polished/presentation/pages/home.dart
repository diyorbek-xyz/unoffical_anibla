import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/presentation/widgets/calendar.dart';
import 'package:application/features/anibla/presentation/widgets/carousel_v2.dart';
import 'package:application/features/anibla/presentation/widgets/media_card.dart';
import 'package:application/features/polished/presentation/controller/media_search_controller.dart';
import 'package:application/features/polished/presentation/things/recommend_reqs.dart';
import 'package:application/features/polished/presentation/widgets/history_widget.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/recommend.dart';
import 'package:application/shared/widgets/responsive.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PolishedHomePage extends StatefulWidget {
  const PolishedHomePage({super.key});

  @override
  State<PolishedHomePage> createState() => _PolishedHomePageState();
}

class _PolishedHomePageState extends State<PolishedHomePage> {
  late final _mythAnimes = sl<MediaSearchController>()..fetch(RecommendRequests.mythAnimes);
  late final _fightAnimes = sl<MediaSearchController>()..fetch(RecommendRequests.fightAnimes);
  late final _thrillerAnimes = sl<MediaSearchController>()..fetch(RecommendRequests.thrillerAnimes);
  late final _movieAnimes = sl<MediaSearchController>()..fetch(RecommendRequests.movieAnimes);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      padding: .all(5),
      child: Column(
        spacing: 5,
        children: [
          _heroBuilder(),
          _materialBuilder(const Calendar()),
          _recommendBuilder(ctrl: _fightAnimes, title: "Jangovar animelar"),
          _recommendBuilder(ctrl: _movieAnimes, title: "Eng yaxshi filmlar"),
          _recommendBuilder(ctrl: _mythAnimes, title: "Murakkab animelar"),
          _recommendBuilder(ctrl: _thrillerAnimes, title: "Triller"),
        ],
      ),
    ),
  );

  Widget _heroBuilder() => PlatformBuilder(
    desktopBuilder: (context, isMobile) => const SizedBox(
      height: 500,
      child: Row(
        children: [
          Expanded(child: CarouselV2()),
          SizedBox(width: 400, child: HistoryWidget()),
        ],
      ),
    ),
    mobileBuilder: (context, isMobile) => const Column(
      children: [
        SizedBox(height: 500, child: CarouselV2()),
        SizedBox(height: 500, child: HistoryWidget()),
      ],
    ),
  );

  Widget _materialBuilder(Widget child) =>
      Material(color: context.colors.surfaceContainer, borderRadius: .circular(20), clipBehavior: .hardEdge, child: child);

  Widget _recommendBuilder({required String title, required MediaSearchController ctrl}) => _materialBuilder(
    SignalBuilder(
      builder: (context) {
        final state = ctrl.animes.state;
        final a = state.request!.toJson().withValue("title", title);
        a.updateAll((key, value) => value.toString());
        return Recommends.signalBuilder(
          title: title,
          value: state.value,
          hasError: state.hasError,
          isLoading: state.isLoading,
          error: state.error,
          onMoreClick: () => context.pushNamed("media-list", queryParameters: a),
          builder: (context, item) => MediaCard.fromAnime(item, aspectRatio: 9 / 15),
        );
      },
    ),
  );
}
