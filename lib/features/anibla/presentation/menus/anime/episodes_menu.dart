import 'dart:async';

import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/episode.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/player/data/model/player_props.dart';
import 'package:application/features/player/presentation/controller/player_controller.dart';
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
  late final PlayerController _playerController;
  late final MediaController _animeController;
  late final EffectCleanup _precacheCleanup;

  final searchController = TextEditingController();
  bool isReversedEpisodeList = false;
  bool isFocused = false;
  Timer? debounce;
  String? search;

  void onSearchChange(String val) {
    debounce?.cancel();
    debounce = Timer(const Duration(seconds: 1), () => onSearchSubmit(val));
  }

  void onSearchSubmit(String val) {
    debounce?.cancel();
    setState(() => search = val);
  }

  bool checkIsContains(Episode entity) {
    if (search == null) return true;
    final hasRusian = entity.title.ru.toLowerCase().contains(search!.toLowerCase());
    final hasUzbek = entity.title.uz.toLowerCase().contains(search!.toLowerCase());
    final hasEpisode = entity.episodeNumber.toString().contains(search!.toLowerCase());
    return hasEpisode || hasUzbek || hasRusian;
  }

  List<Episode> changeList(List<Episode> list) {
    final searched = list.where(checkIsContains).toList();
    if (isReversedEpisodeList) return searched.reversed.toList();
    return searched;
  }

  @override
  void initState() {
    _animeController = sl<MediaController>();
    _playerController = sl<PlayerController>();
    _precacheCleanup = effect(() {
      // final anime = _animeController.animeState.data;
      // if (anime != null && anime.type.isMovie) return _playerController.precache(anime.video);
      // final firstEpisode = _animeController.episodesState.data?.firstOrNull;
      // if (firstEpisode != null) _playerController.precache(firstEpisode.video, false);
    });
    super.initState();
  }

  @override
  void dispose() {
    _precacheCleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final state = _animeController.episodesState.value;
      final episodes = state.value ?? _animeController.fakeEpisodes;
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: CustomScrollView(
            scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
            key: const PageStorageKey("episodes"),
            slivers: [
              SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: .tightFor(width: 600),
                    child: SearchBar(
                      backgroundColor: .all(context.appColors.primaryContainer.withAlpha(120)),
                      controller: searchController,
                      leading: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () => setState(() => isReversedEpisodeList = !isReversedEpisodeList),
                        icon: Icon(Icons.sort_by_alpha),
                      ),
                      trailing: [
                        IconButton(
                          onPressed: () => searchController.clear(),
                          padding: EdgeInsets.all(0),
                          icon: Icon(Icons.clear),
                        ),
                      ],
                      hintText: "Qidirish: ${episodes.length}ta qism",
                      onChanged: onSearchSubmit,
                      onSubmitted: onSearchSubmit,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: .symmetric(vertical: 10),
                sliver: Skeletonizer.sliver(
                  enabled: state.isLoading,
                  child: SliverGrid.extent(
                    maxCrossAxisExtent: 160,
                    childAspectRatio: 15 / 8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: changeList(episodes).asMap().entries.map((entry) {
                      final episode = entry.value;
                      final title = "${episode.episodeNumber}-qism: ${episode.title.uz}";
                      final animeState = _animeController.animeState.value;
                      final anime = animeState.value ?? _animeController.fakeAnime;
                      final props = MediaStream(
                        totalEpisodes: episodes.length,
                        episode: episode.episodeNumber,
                        type: MediaType.serie,
                        episodeTitle: episode.title.uz,
                        url: episode.video,
                        cover: anime.cover,
                        animeTitle: anime.title.uz,
                      );
                      final timeline = null;
                      final typeColor = episode.type.isFree ? context.appColors.secondary : context.appColors.primary;
                      final currentColor = typeColor.withAlpha(50);
                      return RepaintBoundary(
                        child: Tooltip(
                          waitDuration: Duration(seconds: 1),
                          decoration: BoxDecoration(color: context.appColors.primaryContainer),
                          ignorePointer: true,
                          preferBelow: true,
                          textStyle: TextStyle(color: context.appColors.onPrimaryContainer),
                          message: title,
                          child: InkWell(
                            onTap: () => _playerController.init(props),
                            borderRadius: BorderRadius.circular(10),
                            mouseCursor: SystemMouseCursors.click,
                            child: Stack(
                              clipBehavior: .antiAlias,
                              children: [
                                if (timeline != null && timeline.progress.inSeconds > 0 && timeline.duration.inSeconds > 0)
                                  Flexible(
                                    fit: .tight,
                                    child: LayoutBuilder(
                                      builder: (_, consts) => Align(
                                        alignment: .centerStart,
                                        child: Container(
                                          width: (consts.maxWidth * (timeline.progress.inSeconds / timeline.duration.inSeconds)),
                                          color: currentColor.withAlpha(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: currentColor, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: .symmetric(horizontal: 10),
                                  alignment: AlignmentGeometry.center,
                                  child: Column(
                                    crossAxisAlignment: .center,
                                    mainAxisAlignment: .center,
                                    spacing: 5,
                                    children: [
                                      Text(
                                        "${episode.episodeNumber}-qism",
                                        style: context.textTheme.titleMedium!.copyWith(
                                          color: context.appColors.onPrimaryContainer,
                                        ),
                                      ),
                                      Text(episode.title.uz, maxLines: 1, overflow: .ellipsis),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
