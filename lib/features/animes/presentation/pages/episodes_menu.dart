import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/controller/anime_controller.dart';
import 'package:application/features/animes/presentation/widgets/download_dialog.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimeEpisodesMenu extends StatefulWidget {
  const AnimeEpisodesMenu({super.key});

  @override
  State<AnimeEpisodesMenu> createState() => _AnimeEpisodesMenuState();
}

class _AnimeEpisodesMenuState extends State<AnimeEpisodesMenu> {
  late final AnimeController _animeController;

  @override
  void initState() {
    super.initState();
    _animeController = sl<AnimeController>();
  }

  void openDownloadMenu(EpisodeEntity episode) => showDialog(
    context: context,
    builder: (dialog) => DownloadMenu(episode: episode),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: CustomScrollView(
          scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
          key: const PageStorageKey("episodes"),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SignalBuilder(
              builder: (context) {
                final state = _animeController.episodesState.value;
                final episodes = state.value ?? _animeController.fakeEpisodes;
                return Skeletonizer.sliver(
                  enabled: state.isLoading,
                  child: SliverGrid.extent(
                    maxCrossAxisExtent: 100,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: episodes
                        .map(
                          (e) => InkWell(
                            onTap: () => openDownloadMenu(e),
                            hoverColor: context.appColors.primaryContainer.withAlpha(70),
                            splashColor: context.appColors.primaryContainer.withAlpha(70),
                            focusColor: context.appColors.primaryContainer.withAlpha(70),
                            highlightColor: context.appColors.primaryContainer.withAlpha(70),
                            borderRadius: BorderRadius.circular(16),
                            mouseCursor: SystemMouseCursors.click,
                            child: Align(alignment: AlignmentGeometry.center, child: Text("${e.episodeNumber}-qism")),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
