import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/controller/anime_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_states.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EpisodesDrawer extends StatefulWidget {
  const EpisodesDrawer({super.key});

  @override
  State<EpisodesDrawer> createState() => _EpisodesDrawerState();
}

class _EpisodesDrawerState extends State<EpisodesDrawer> {
  late final PlayerController _playerController;
  late final AnimeController _animeController;

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

  bool checkIsContains(EpisodeEntity entity) {
    if (search == null) return true;
    final hasRusian = entity.title.ru.toLowerCase().contains(search!.toLowerCase());
    final hasUzbek = entity.title.uz.toLowerCase().contains(search!.toLowerCase());
    final hasEpisode = entity.episodeNumber.toString().contains(search!.toLowerCase());
    return hasEpisode || hasUzbek || hasRusian;
  }

  List<EpisodeEntity> changeList(List<EpisodeEntity> list) {
    final searched = list.where(checkIsContains).toList();
    if (isReversedEpisodeList) return searched.reversed.toList();
    return searched;
  }

  @override
  void initState() {
    _animeController = sl<AnimeController>();
    _playerController = context.read<PlayerController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final state = _animeController.episodesState.value;
        final episodes = state.value ?? _animeController.fakeEpisodes;
        final current = _playerController.state.stream.offset;
        return Column(
          children: [
            TextField(
              controller: searchController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hint: Text("Qidirish: ${episodes.length}ta qism "),
                isDense: true,
                isCollapsed: false,
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                prefixIcon: Padding(
                  padding: EdgeInsetsGeometry.only(left: 10),
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 10,
                    children: [
                      IconButton(padding: EdgeInsets.all(0), onPressed: Scaffold.of(context).closeEndDrawer, icon: Icon(Icons.keyboard_arrow_left)),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () => setState(() => isReversedEpisodeList = !isReversedEpisodeList),
                        icon: Icon(Icons.sort_by_alpha),
                      ),
                    ],
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsetsGeometry.only(right: 10),
                  child: IconButton(onPressed: () => searchController.clear(), padding: EdgeInsets.all(0), icon: Icon(Icons.clear)),
                ),
              ),
              onChanged: onSearchChange,
              onSubmitted: onSearchSubmit,
            ),
            Expanded(
              child: Material(
                type: .transparency,
                clipBehavior: .hardEdge,
                child: GridView.extent(
                  padding: .all(10),
                  maxCrossAxisExtent: 160,
                  childAspectRatio: 15 / 8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  addRepaintBoundaries: true,
                  physics: BouncingScrollPhysics(),
                  children: changeList(episodes).asMap().entries.map((entry) {
                    final episode = entry.value;
                    final isCurrent = current == entry.value.episodeNumber;
                    final title = "${episode.episodeNumber}-qism: ${episode.title.uz}";
                    final animeState = _animeController.mediaState.value;
                    final anime = animeState.value ?? _animeController.fakeMedia;
                    final props = PlayerProps(
                      all: episodes.length,
                      offset: episode.episodeNumber,
                      type: AnimeType.serie,
                      title: episode.title.uz,
                      stream: episode.video,
                      cover: anime.cover,
                      anime: anime.title.uz,
                    );
                    final timeline = episode.timeline;
                    final typeColor = episode.type == 'free' ? context.appColors.secondary : context.appColors.primary;
                    final currentColor = typeColor.withAlpha(isCurrent ? 255 : 50);
                    return RepaintBoundary(
                      child: Tooltip(
                        waitDuration: Duration(seconds: 1),
                        decoration: BoxDecoration(color: context.appColors.primaryContainer),
                        ignorePointer: true,
                        preferBelow: true,
                        textStyle: TextStyle(color: context.appColors.onPrimaryContainer),
                        message: title,
                        child: InkWell(
                          onTap: () => _playerController.openStream(props),
                          borderRadius: BorderRadius.circular(10),
                          mouseCursor: SystemMouseCursors.click,
                          child: Stack(
                            clipBehavior: .antiAlias,
                            children: [
                              if (timeline != null && timeline.progress.inSeconds > 0 && timeline.duration.inSeconds > 0)
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  child: LayoutBuilder(
                                    builder: (_, consts) {
                                      return Align(
                                        alignment: .centerStart,
                                        child: Container(
                                          width: (consts.maxWidth * (timeline.progress.inSeconds / timeline.duration.inSeconds)),
                                          color: currentColor.withAlpha(20),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: currentColor, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: .symmetric(horizontal: 10),
                                alignment: AlignmentGeometry.center,
                                child: Column(
                                  crossAxisAlignment: .center,
                                  mainAxisAlignment: .center,
                                  spacing: 5,
                                  children: [
                                    Text("${episode.episodeNumber}-qism"),
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
        );
      },
    );
  }
}
