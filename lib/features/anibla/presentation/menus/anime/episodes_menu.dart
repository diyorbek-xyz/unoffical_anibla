import 'dart:async';

import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/view_model/media_chapter.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AnimeEpisodesMenu extends StatefulWidget {
  final List<MediaChapter> chapters;
  final void Function(MediaChapter key) openChapter;
  final int total;
  const AnimeEpisodesMenu({super.key, required this.chapters, required this.total, required this.openChapter});

  @override
  State<AnimeEpisodesMenu> createState() => _AnimeEpisodesMenuState();
}

class _AnimeEpisodesMenuState extends State<AnimeEpisodesMenu> {
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

  bool checkIsContains(String title) {
    if (search == null) return true;
    final hasRusian = title.toLowerCase().contains(search!.toLowerCase());
    final hasUzbek = title.toLowerCase().contains(search!.toLowerCase());
    return hasUzbek || hasRusian;
  }

  List<MediaChapter> changeList(List<MediaChapter> list) {
    final searched = list.where((e) => checkIsContains(e.title)).toList();
    if (isReversedEpisodeList) return searched.reversed.toList();
    return searched;
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) => Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: CustomScrollView(
          scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
          key: const PageStorageKey("episodes"),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverToBoxAdapter(child: searchBar),
            SliverPadding(
              padding: .symmetric(vertical: 10),
              sliver: SliverGrid.extent(
                maxCrossAxisExtent: 160,
                childAspectRatio: 15 / 8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: changeList(widget.chapters).map(chapterItem).toList(),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget chapterItem(MediaChapter value) {
    final typeColor = value.isFree ? context.appColors.secondary : context.appColors.primary;
    final currentColor = typeColor.withAlpha(50);
    return RepaintBoundary(
      child: Tooltip(
        waitDuration: Duration(seconds: 1),
        decoration: BoxDecoration(color: context.appColors.primaryContainer),
        ignorePointer: true,
        preferBelow: true,
        textStyle: TextStyle(color: context.appColors.onPrimaryContainer),
        message: "${value.offset}-qism: ${value.title}",
        child: InkWell(
          onTap: () => widget.openChapter(value),
          borderRadius: BorderRadius.circular(10),
          mouseCursor: SystemMouseCursors.click,
          child: Stack(
            clipBehavior: .antiAlias,
            children: [
              if (value.progress > 0.0)
                Flexible(
                  fit: .tight,
                  child: LayoutBuilder(
                    builder: (_, consts) => Align(
                      alignment: .centerStart,
                      child: Container(width: (consts.maxWidth * value.progress), color: currentColor.withAlpha(20)),
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
                      "${value.offset}-qism",
                      style: context.textTheme.titleMedium!.copyWith(color: context.appColors.onPrimaryContainer),
                    ),
                    Text(value.title, maxLines: 1, overflow: .ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get searchBar => Builder(
    builder: (context) => Center(
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
          trailing: [IconButton(onPressed: () => searchController.clear(), padding: EdgeInsets.all(0), icon: Icon(Icons.clear))],
          hintText: "Qidirish: ${widget.total}ta qism",
          onChanged: onSearchSubmit,
          onSubmitted: onSearchSubmit,
        ),
      ),
    ),
  );
}

// final animeState = _animeController.animeState.value;
// final anime = animeState.value ?? _animeController.fakeAnime;
// final props = MediaStream(
//   totalEpisodes: episodes.length,
//   episode: value.offset,
//   type: MediaType.serie,
//   episodeTitle: value.title,
//   url: value.mediaUrl,
//   cover: anime.cover,
//   animeTitle: anime.title.uz,
// );
