import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/data/models/page_props.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/saved_medias.dart';
import 'package:application/features/animes/presentation/controller/saved_controller.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/common/domain/entities/tab_item.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/explore/presentation/controller/explore_controller.dart';
import 'package:application/features/profile/presentation/widget/navigation_tabs.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/cupertino.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: _savedController.refreshSaveds),

          SliverCrossAxisGroup(
            slivers: [
              SliverConstrainedCrossAxis(
                maxExtent: 300,
                sliver: NavigationTabs.sliver(
                  tabs: tabs,
                  selectedIndex: currentIndex,
                  onTabSelected: (index) => setState(() => currentIndex = index),
                ),
              ),
              SliverConstrainedCrossAxis(maxExtent: 20, sliver: SliverToBoxAdapter()),
              [savedAnimes, historyAnimes, downloadedAnimes][currentIndex],
            ],
          ),
        ],
      ),
    );
  }

  SignalBuilder get downloadedAnimes => SignalBuilder(
    builder: (context) {
      final data = _savedController.downloadedMediaSignal.value;
      return SliverMainAxisGroup(
        slivers: [
          title("Yuklab olingan animelar", Icons.download),
          SliverList.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final infos = data[index].infos;
              print(data[index].mediaPlaylist.localUrl);
              print(data[index].mediaPlaylist.downloadUrl);
              print(data[index].infos.streamUrl);
              print(data[index].infos.downloadUrl);
              print(data[index].infos.localFolderUrl);
              print(data[index].infos.localPath);
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
        ],
      );
    },
  );

  SignalBuilder get historyAnimes => SignalBuilder(
    builder: (context) {
      final state = _exploreController.historySignal.value;
      final data = state.value ?? [];
      return SliverMainAxisGroup(slivers: [title("Ko'rilgan animelar", Icons.history), if (data.isNotEmpty) animeBuilder(data)]);
    },
  );

  SignalBuilder get savedAnimes => SignalBuilder(
    builder: (context) {
      final state = _savedController.savedMediaSignal.value;
      final data = state.value ?? SavedMedias();
      return SliverMainAxisGroup(
        slivers: [
          if (data.movies.isNotEmpty) title("Saqlangan filmlar", Icons.movie),
          if (data.movies.isNotEmpty) animeBuilder(data.movies),
          if (data.series.isNotEmpty) title("Saqlangan seriyalar", Icons.bookmark),
          if (data.series.isNotEmpty) animeBuilder(data.series),
        ],
      );
    },
  );

  SliverGrid animeBuilder(List<AnimeEntity> animes) => SliverGrid.builder(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 220,
      childAspectRatio: 9 / 15,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    ),
    itemCount: animes.length,
    itemBuilder: (context, index) => AnimeCard(aspectRatio: 9 / 15, anime: animes[index]),
  );

  SliverPadding title(String text, IconData icon) => SliverPadding(
    padding: .only(bottom: 20, top: 10),
    sliver: SliverToBoxAdapter(
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
    ),
  );
}
