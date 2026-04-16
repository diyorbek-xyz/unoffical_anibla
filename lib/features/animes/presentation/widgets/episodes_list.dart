import 'dart:async';

import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/download/download_bloc.dart';
import 'package:application/features/animes/presentation/bloc/download/download_state.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/animes/presentation/bloc/watch/watch_bloc.dart';
import 'package:application/features/animes/presentation/bloc/watch/watch_event.dart';
import 'package:application/features/animes/presentation/bloc/watch/watch_state.dart';
import 'package:application/features/animes/presentation/widgets/download_modal.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EpisodesList extends StatefulWidget {
  const EpisodesList({super.key});

  @override
  State<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
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
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeBloc, EpisodeState>(
      builder: (context, state) {
        switch (state) {
          case EpisodeFailure():
            return Center(child: Text(state.message));
          case EpisodeLoading():
          case EpisodeInitial():
          case EpisodeSuccess():
            final isLoading = state is! EpisodeSuccess;
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
                      prefixIcon: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () =>
                            setState(() => isReversedEpisodeList = !isReversedEpisodeList),
                        icon: Icon(
                          isReversedEpisodeList
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.clear),
                      ),
                    ),
                    onChanged: onSearchChange,
                    onSubmitted: onSearchSubmit,
                  ),
                  Expanded(
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      child: ListView(
                        children: changeList(data).map((episode) {
                          return RepaintBoundary(child: EpisodeItem(episode: episode));
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}

class EpisodeItem extends StatefulWidget {
  final EpisodeEntity episode;
  const EpisodeItem({super.key, required this.episode});

  @override
  State<EpisodeItem> createState() => _EpisodeItemState();
}

class _EpisodeItemState extends State<EpisodeItem> {
  @override
  Widget build(BuildContext context) {
    final watchState = context.watch<WatchBloc>().state;
    return BlocProvider(
      create: (context) => sl<DownloadBloc>(),
      child: BlocBuilder<DownloadBloc, DownloadState>(
        builder: (context, state) {
          return ListTile(
            selected: watchState is WatchDone
                ? widget.episode.episodeNumber == watchState.currentEpisode.episodeNumber
                : false,
            onTap: () => context.read<WatchBloc>().add(SetEpisode(widget.episode)),
            leading: Tooltip(
              message: widget.episode.type == EpisodeType.free ? "Bepul" : "Obuna kerak",
              child: Icon(
                widget.episode.type == EpisodeType.free ? Icons.money_off : Icons.attach_money,
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
                IconButton(
                  onPressed: () => showDownloadModal(context, widget.episode),
                  tooltip: "Yuklab olish",
                  icon: Icon(Icons.download),
                ),
              ],
            ),
            title: Text("${widget.episode.episodeNumber}-qism"),
            subtitle: Text(toBeginningOfSentenceCase(widget.episode.title.uz)),
          );
        },
      ),
    );
  }
}
