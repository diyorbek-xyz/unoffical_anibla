import 'dart:async';

import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesDrawer extends StatefulWidget {
  const EpisodesDrawer({super.key});

  @override
  State<EpisodesDrawer> createState() => _EpisodesDrawerState();
}

class _EpisodesDrawerState extends State<EpisodesDrawer> {
  late PlayerController controller;
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
    controller = context.read<PlayerController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeBloc, EpisodeState>(
      builder: (context, state) {
        final List<EpisodeEntity> episodes = state is EpisodeSuccess ? state.episodes : [];
        final current = controller.state.streamId;
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
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () => setState(() => isReversedEpisodeList = !isReversedEpisodeList),
                    icon: Icon(isReversedEpisodeList ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
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
                  maxCrossAxisExtent: 140,
                  childAspectRatio: 15 / 8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  addRepaintBoundaries: true,
                  physics: BouncingScrollPhysics(),
                  children: changeList(episodes).asMap().entries.map((entry) {
                    final episode = entry.value;
                    final isCurrent = (current.isNotEmpty && episode.video.isNotEmpty) ? current == getStreamId(episode.video) : false;
                    final title = "${episode.episodeNumber}-qism: ${episode.title.uz}";
                    final PlaylistPosition pos = entry.key == 0
                        ? .first
                        : entry.key == (episodes.length - 1)
                        ? .last
                        : .middle;
                    final animeState = context.read<AnimeBloc>().state;
                    final anime = animeState is AnimeSuccess ? animeState.anime : null;
                    final props = PlayerProps(
                      position: pos,
                      type: AnimeType.serie,
                      title: title,
                      stream: episode.video,
                      cover: anime?.cover ?? "",
                      anime: anime?.title.uz ?? "",
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
                        message: "${episode.episodeNumber}-qism ~ ${episode.title.uz}",
                        child: InkWell(
                          onTap: () => controller.openStream(props),
                          hoverColor: currentColor.withAlpha(50),
                          splashColor: currentColor.withAlpha(50),
                          focusColor: currentColor.withAlpha(50),
                          highlightColor: currentColor.withAlpha(50),
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
                                padding: .all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: currentColor, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
