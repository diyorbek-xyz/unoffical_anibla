import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EpisodesList extends StatefulWidget {
  final Function? onItemPressed;
  const EpisodesList({super.key, this.onItemPressed});

  @override
  State<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
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
        final isLoading = state is! EpisodeSuccess;
        final fake = List.generate(12, (index) => EpisodeMapper.modelToEntity(null));
        final current = controller.state.stream.offset;
        final data = isLoading ? fake : state.episodes;
        return Skeletonizer(
          enabled: isLoading,
          enableSwitchAnimation: true,
          child: Column(
            children: [
              TextField(
                controller: searchController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hint: Text("Qidirish: ${data.length}ta qism "),
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
                  clipBehavior: Clip.hardEdge,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    addRepaintBoundaries: true,
                    children: changeList(data).asMap().entries.map((entry) {
                      final episode = entry.value;
                      final isCurrent = entry.key == current;
                      final title = "${episode.episodeNumber}-qism: ${episode.title.uz}";
                      final animeState = context.read<AnimeBloc>().state;
                      final anime = animeState is AnimeSuccess ? animeState.anime : null;
                      final props = PlayerProps(
                        all: data.length,
                        offset: entry.key,
                        type: AnimeType.serie,
                        title: title,
                        stream: episode.video,
                        cover: anime?.cover ?? "",
                        anime: anime?.title.uz ?? "",
                      );
                      final timeline = episode.timeline;
                      return RepaintBoundary(
                        child: Stack(
                          fit: StackFit.passthrough,
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
                                        color: context.appColors.primary.withAlpha(20),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ListTile(
                              selected: isCurrent,
                              tileColor: Colors.transparent,
                              onTap: () {
                                if (widget.onItemPressed != null) widget.onItemPressed!();
                                controller.openStream(props);
                              },
                              leading: Tooltip(
                                message: episode.type == EpisodeType.free ? "Bepul" : "Obuna kerak",
                                child: Icon(episode.type == EpisodeType.free ? Icons.money_off : Icons.attach_money),
                              ),
                              isThreeLine: true,
                              trailing: Row(
                                mainAxisSize: .min,
                                children: [IconButton(onPressed: () {}, tooltip: "Saqlash", icon: Icon(Icons.bookmark_outline))],
                              ),
                              title: Text("${episode.episodeNumber}-qism"),
                              subtitle: Text(toBeginningOfSentenceCase(episode.title.uz)),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
