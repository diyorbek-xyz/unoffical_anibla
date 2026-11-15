import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/models/view/media_info_entry.dart';
import 'package:application/features/anibla/presentation/menus/anime/comments_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/episodes_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/infos_menu.dart';
import 'package:application/features/anibla/presentation/widgets/media_page_hero.dart';
import 'package:application/features/anibla/presentation/wrappers/media_wrapper.dart';
import 'package:application/features/polished/presentation/controller/media_controller.dart';
import 'package:application/features/polished/view_models/media/media_view.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MediaPage extends StatefulWidget {
  final MediaProps mediaProps;
  const MediaPage(this.mediaProps, {super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  late final _mediaController = sl<MediaController>();

  @override
  void initState() {
    super.initState();
    _mediaController.getFullMedia(widget.mediaProps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "media",
        shape: CircleBorder(),
        onPressed: () => _mediaController.openMedia(context),
        child: Icon(Icons.play_arrow),
      ),
      body: SignalBuilder(
        builder: (context) {
          final mediaState = _mediaController.media.value;
          if (mediaState.hasError) return ErrorBuilder(message: mediaState.error ?? "Nimadur xato ketti", refresh: () {});
          if (mediaState.isLoading) return Center(child: CircularProgressIndicator());
          final view = mediaState.value!;
          final (views, items, tabs) = switch (widget.mediaProps.type) {
            .serie || .movie => _animeDataMaker(view),
            _ => _mangaDataMaker(view),
          };
          return DefaultTabController(
            length: views.length,
            child: NestedScrollView(
              clipBehavior: Clip.hardEdge,
              headerSliverBuilder: (_, isScrolled) => [
                MediaPageHero(
                  cover: view.cover,
                  heroTag: widget.mediaProps.heroTag,
                  tabs: tabs,
                  items: items,
                  isSaved: false,
                  isScrolled: isScrolled,
                  title: view.title,
                  thumbnail: view.thumbnail,
                ),
              ],
              body: TabBarView(children: views),
            ),
          );
        },
      ),
    );
  }

  (List<Widget>, Map<String, Object>, List<String>) _animeDataMaker(MediaView view) {
    final translators = view.translators.entries
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
      child: view.frames.isEmpty
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
              onTap: (value) => openImagePreveiwDialog(context, view.frames, value),
              children: view.frames.map((e) => Ink.image(fit: .cover, image: imageProviderFallback(addBaseUrl(e)))).toList(),
            ),
    );
    final views = [
      AnimeInfosMenu([
        Single("Anime haqida ma'lumot", view.description),
        Multi("Tarjimonlar", translators),
        MultiActions("Janrlar", view.genres.entries.map((e) => e.value).toList()),
        MultiActions("Kategoriya", view.categories.entries.map((e) => e.value).toList(), true),
        Custom("Animedan kadrlar", frames),
      ]),
      CommentsMenu(),
      if (view.type.isSerie) ChaptersMenu(),
    ];
    final items = {"Chiqarilgan yil:": "${view.releaseYear}-yil", "Studio:": view.studio, "Something:": view.studio};
    final tabs = ["Ma'lumotlar", "Izohlar", if (view.type.isSerie) "Qismlar"];

    return (views, items, tabs);
  }

  (List<Widget>, Map<String, Object>, List<String>) _mangaDataMaker(MediaView view) {
    final translators = view.translators.entries
        .map(
          (e) => ActionChip(
            onPressed: () {},
            labelPadding: .all(20),
            label: Text(e.value, style: context.textTheme.titleMedium),
          ),
        )
        .toList();
    final items = {"Chiqarilgan yili": view.releaseYear, "Ko'rishlar": view.views, "Yoqtirishlar": view.likes};
    final tabs = ["Ma'lumotlar", "Boblar"];
    final views = [
      AnimeInfosMenu([
        Single("Novella haqida ma'lumot", view.description),
        Multi("Tarjimonlar", translators),
        if (view.genres.isNotEmpty) MultiActions("Janrlar", view.genres.entries.map((e) => e.value).toList()),
        if (view.categories.isNotEmpty) MultiActions("Kategoriya", view.categories.entries.map((e) => e.value).toList()),
      ]),
      ChaptersMenu(),
    ];
    return (views, items, tabs);
  }
}
