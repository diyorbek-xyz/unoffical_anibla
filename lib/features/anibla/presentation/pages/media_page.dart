import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/models/view/media_info_entry.dart';
import 'package:application/features/anibla/data/view_model/media_view.dart';
import 'package:application/features/anibla/presentation/menus/anime/comments_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/episodes_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/infos_menu.dart';
import 'package:application/features/anibla/presentation/widgets/media_page_hero.dart';
import 'package:application/features/anibla/presentation/wrappers/media_wrapper.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:material_ui/material_ui.dart';

class MediaPage extends StatelessWidget {
  final MediaProps mediaProps;
  final MediaView mediaInfos;
  const MediaPage({super.key, required this.mediaInfos, required this.mediaProps});

  @override
  Widget build(BuildContext context) {
    final (views, items, tabs) = switch (mediaInfos.type) {
      .serie || .movie => _animeDataMaker(context),
      _ => _mangaDataMaker(context),
    };
    return DefaultTabController(
      length: views.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "media",
          shape: CircleBorder(),
          onPressed: () => mediaInfos.openMedia(null),
          child: Icon(Icons.play_arrow),
        ),
        body: NestedScrollView(
          clipBehavior: Clip.hardEdge,
          headerSliverBuilder: (_, isScrolled) => [
            MediaPageHero(
              tabs: tabs,
              items: items,
              isSaved: false,
              isScrolled: isScrolled,
              title: mediaInfos.title,
              thumbnail: mediaInfos.thumbnail,
            ),
          ],
          body: TabBarView(children: views),
        ),
      ),
    );
  }

  (List<Widget>, Map<String, Object>, List<String>) _animeDataMaker(BuildContext context) {
    final translators = mediaInfos.translators.entries
        .map(
          (e) => ActionChip(
            onPressed: () {},
            labelPadding: .all(20),
            label: Text(e.value, style: context.textTheme.titleMedium),
          ),
        )
        .toList();
    final frames = SizedBox(
      height: 320,
      child: mediaInfos.frames.isEmpty
          ? null
          : CarouselView.weighted(
              elevation: 1,
              itemSnapping: true,
              enableSplash: true,
              flexWeights: context.isMobile ? [1] : [1, 2, 1],
              shrinkExtent: 10,
              itemClipBehavior: Clip.antiAlias,
              infinite: true,
              padding: EdgeInsets.all(3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
              onTap: (value) => openImagePreveiwDialog(context, mediaInfos.frames, value),
              children: mediaInfos.frames
                  .map((e) => Ink.image(fit: .cover, image: imageProviderFallback(addBaseUrl(e))))
                  .toList(),
            ),
    );
    final views = [
      AnimeInfosMenu([
        Single("Anime haqida ma'lumot", mediaInfos.description),
        Multi("Tarjimonlar", translators),
        MultiActions("Janrlar", mediaInfos.genres.entries.map((e) => e.value).toList()),
        MultiActions("Kategoriya", mediaInfos.categories.entries.map((e) => e.value).toList(), true),
        Custom("Animedan kadrlar", frames),
      ]),
      CommentsMenu(),
      if (mediaInfos.type.isSerie)
        AnimeEpisodesMenu(total: mediaInfos.chapters.length, chapters: mediaInfos.chapters, openChapter: mediaInfos.openMedia),
    ];
    final items = {
      "Chiqarilgan yil:": "${mediaInfos.releaseYear}-yil",
      "Studio:": mediaInfos.studio,
      "Something:": mediaInfos.studio,
    };
    final tabs = ["Ma'lumotlar", "Izohlar", if (mediaInfos.type.isSerie) "Qismlar"];

    return (views, items, tabs);
  }

  (List<Widget>, Map<String, Object>, List<String>) _mangaDataMaker(BuildContext context) {
    final translators = mediaInfos.translators.entries
        .map(
          (e) => ActionChip(
            onPressed: () {},
            labelPadding: .all(20),
            label: Text(e.value, style: context.textTheme.titleMedium),
          ),
        )
        .toList();
    final items = {"Chiqarilgan yili": mediaInfos.releaseYear, "Ko'rishlar": mediaInfos.views, "Yoqtirishlar": mediaInfos.likes};
    final tabs = ["Ma'lumotlar", "Boblar"];
    final views = [
      AnimeInfosMenu([
        Single("Novella haqida ma'lumot", mediaInfos.description),
        Multi("Tarjimonlar", translators),
        if (mediaInfos.genres.isNotEmpty) MultiActions("Janrlar", mediaInfos.genres.entries.map((e) => e.value).toList()),
        if (mediaInfos.categories.isNotEmpty)
          MultiActions("Kategoriya", mediaInfos.categories.entries.map((e) => e.value).toList()),
      ]),
      AnimeEpisodesMenu(
        chapters: mediaInfos.chapters,
        total: mediaInfos.chapters.length,
        openChapter: (key) => mediaInfos.openMedia,
      ),
    ];
    return (views, items, tabs);
  }
}
