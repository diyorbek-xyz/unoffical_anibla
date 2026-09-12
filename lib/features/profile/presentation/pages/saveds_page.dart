import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/data/models/page_props.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/saved_medias.dart';
import 'package:application/features/animes/presentation/controller/saved_controller.dart';
import 'package:application/features/animes/presentation/widgets/horizontal_card.dart';
import 'package:application/features/common/domain/entities/tab_item.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/explore/presentation/controller/explore_controller.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

final tabs = [
  TabItem(activeIcon: Icons.bookmark, icon: Icons.bookmark_outline, label: "Saqlanganlar"),
  TabItem(activeIcon: Icons.history, icon: Icons.history_outlined, label: "Tarix"),
  TabItem(activeIcon: Icons.download, icon: Icons.download_outlined, label: "Yuklanganlar"),
];

class SavedsPage extends StatefulWidget {
  const SavedsPage({super.key});

  @override
  State<SavedsPage> createState() => _SavedsPageState();
}

class _SavedsPageState extends State<SavedsPage> {
  final _savedController = sl<LocalAnimesController>();
  final _exploreController = sl<ExploreController>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Center(child: Text("Mening animelarim", style: context.textTheme.titleLarge)),
          bottom: TabBar(
            tabAlignment: .center,
            isScrollable: false,
            dividerHeight: 0,
            tabs: [
              Tab(text: "Saqlanganlar"),
              Tab(text: "Ko'rilganlar"),
              Tab(text: "Yuklanganlar"),
            ],
          ),
        ),
        body: Material(
          type: .transparency,
          child: TabBarView(
            children: [
              savedAnimes,
              historyAnimes,
              downloadedAnimes,
            ].map((e) => SingleChildScrollView(physics: BouncingScrollPhysics(), child: e)).toList(),
          ),
        ),
      ),
    );
  }

  SignalBuilder get downloadedAnimes => SignalBuilder(
    builder: (context) {
      final data = _savedController.downloadedMediaSignal.value;
      return Column(
        mainAxisSize: .min,
        children: [
          title("Yuklab olingan animelar", Icons.download),
          Flexible(
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              itemBuilder: (context, index) {
                final infos = data[index].infos;
                return ListTile(
                  title: Text(infos.anime.title.uz),
                  onTap: () => context.pushNamed(
                    "watch",
                    queryParameters: AnimePageProps(
                      animeType: infos.anime.type,
                      animeSlug: infos.anime.slug,
                      localPath: data[index].masterPlaylist.localUrl,
                    ).toJson(),
                  ),
                  subtitle: Text("${infos.season.title.uz} fasl ~ ${infos.episode.episodeNumber}-qism"),
                );
              },
            ),
          ),
        ],
      );
    },
  );

  SignalBuilder get historyAnimes => SignalBuilder(
    builder: (context) {
      final state = _exploreController.historySignal.value;
      final data = state.value ?? [];
      return Column(mainAxisSize: .min, children: [title("Ko'rilgan animelar", Icons.history), if (data.isNotEmpty) animeBuilder(data)]);
    },
  );

  SignalBuilder get savedAnimes => SignalBuilder(
    builder: (context) {
      final state = _savedController.savedMediaSignal.value;
      final data = state.value ?? SavedMedias();
      return Column(
        mainAxisSize: .min,
        children: [
          if (data.movies.isNotEmpty) title("Saqlangan filmlar", Icons.movie),
          if (data.movies.isNotEmpty) animeBuilder(data.movies, false),
          if (data.series.isNotEmpty) title("Saqlangan seriyalar", Icons.bookmark),
          if (data.series.isNotEmpty) animeBuilder(data.series, false),
        ],
      );
    },
  );

  Widget animeBuilder(List<AnimeEntity> animes, [bool hasGenre = true]) => Flexible(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 260,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 9 / 11,
      ),
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: animes.length,
      itemBuilder: (context, index) => HorizontalCard(aspectRatio: 9 / 11, anime: animes[index], hasGenre: hasGenre),
    ),
  );

  Widget title(String text, IconData icon) => Padding(
    padding: .only(bottom: 20, top: 30),
    child: PlatformBuilder(
      mobileBuilder: (context, _) => Text(text, style: context.textTheme.headlineSmall),
      desktopBuilder: (context, _) => Row(
        spacing: 10,
        children: [
          Icon(icon, size: 30),
          Expanded(child: Text(text, style: context.textTheme.headlineSmall)),
        ],
      ),
    ),
  );
}
