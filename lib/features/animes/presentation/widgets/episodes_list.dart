import 'dart:async';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
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
    return BlocBuilder<PlayerController, PlayerStates>(
      buildWhen: (previous, current) =>
          previous.episode.id != current.episode.id || previous.error != current.error,
      builder: (context, state) {
        final isLoading = state.hasError && state.error == 'empty';
        final fake = List.generate(12, (index) => EpisodeMapper.modelToEntity(null));
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
                      onPressed: () =>
                          setState(() => isReversedEpisodeList = !isReversedEpisodeList),
                      icon: Icon(
                        isReversedEpisodeList ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      ),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsetsGeometry.only(right: 10),
                    child: IconButton(
                      onPressed: () => searchController.clear(),
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.clear),
                    ),
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
                    children: changeList(data).map((episode) {
                      final isCurrent = isLoading
                          ? false
                          : state.episode.episodeNumber == episode.episodeNumber;
                      return RepaintBoundary(
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            if (episode.timeline != null)
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
                                        width:
                                            consts.maxWidth *
                                            (episode.timeline!.progress.inSeconds /
                                                episode.timeline!.duration.inSeconds),
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
                                controller.openEpisode(episode);
                              },
                              leading: Tooltip(
                                message: episode.type == EpisodeType.free ? "Bepul" : "Obuna kerak",
                                child: Icon(
                                  episode.type == EpisodeType.free
                                      ? Icons.money_off
                                      : Icons.attach_money,
                                ),
                              ),
                              isThreeLine: true,
                              trailing: Row(
                                mainAxisSize: .min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    tooltip: "Saqlash",
                                    icon: Icon(Icons.bookmark_outline),
                                  ),
                                ],
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
