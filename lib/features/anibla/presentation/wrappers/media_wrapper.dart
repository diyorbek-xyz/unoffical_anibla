import 'dart:ui';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/models/view/media_info_entry.dart';
import 'package:application/features/anibla/data/view_model/media_chapter.dart';
import 'package:application/features/anibla/data/view_model/media_view.dart';
import 'package:application/features/anibla/presentation/dialogs/image_preview.dart';
import 'package:application/features/anibla/presentation/menus/anime/comments_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/creators_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/episodes_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/infos_menu.dart';
import 'package:application/features/anibla/presentation/pages/media_page.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:application/features/anibla/presentation/controllers/comment_controller.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/anibla/presentation/controllers/saved_controller.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/injection_container.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MediaWrapper extends StatefulWidget {
  final MediaProps props;
  const MediaWrapper(this.props, {super.key});

  @override
  State<MediaWrapper> createState() => _MediaWrapperState();
}

class _MediaWrapperState extends State<MediaWrapper> {
  late final LocalAnimesController? _savedController;
  late final MediaController _mediaController;
  late final BookController _bookController;
  late final CommentController _commentController;
  late final EffectCleanup _errorDialogCleanup;
  EffectCleanup? _commentsCleanup;
  bool isSaved = false;

  void toggleSave(String id) {
    _savedController?.saveMedia(id, widget.props.type);
    setState(() => isSaved = !isSaved);
  }

  void errorHandler() {
    if (_bookController.novel.hasError && widget.props.type.isNovel) {
      openErrorDialog(
        context,
        refresh: _bookController.refreshNewest,
        error: _bookController.novel.error ?? "Nimadur xato ketti",
      );
    }
    if (_bookController.manga.hasError && widget.props.type.isManga) {
      openErrorDialog(
        context,
        refresh: _bookController.refreshNewest,
        error: _bookController.manga.error ?? "Nimadur xato ketti",
      );
    }
    if (_mediaController.animeState.hasError && widget.props.type.isAnime) {
      openErrorDialog(
        context,
        refresh: _mediaController.refreshFullAnime,
        error: _mediaController.animeState.error ?? "Nimadur xato ketti",
      );
    }
  }

  void getMedia() async {
    if (widget.props.type.isAnime) return await _mediaController.getFullAnime(widget.props.type, widget.props.mediaKey);
    if (widget.props.type.isBook) return await _bookController.getFullBook(widget.props.type, widget.props.mediaKey);
  }

  @override
  void initState() {
    super.initState();
    _bookController = sl<BookController>();
    _mediaController = sl<MediaController>();
    _commentController = sl<CommentController>();
    _errorDialogCleanup = effect(errorHandler);
    getMedia();
    if (widget.props.type.isBook) return;
    _savedController = sl<LocalAnimesController>();
    _commentsCleanup = _mediaController.animeState.subscribe((value) {
      if (value.hasValue) _commentController.getAnimeComments(20);
    });
  }

  @override
  void dispose() {
    _mediaController.resetMedia();
    _commentController.resetAll();
    _commentsCleanup?.call();
    _errorDialogCleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final mediaProps = widget.props;
      final mediaInfo = switch (widget.props.type) {
        .comics || .manga || .manxva => buildMangaProps(),
        .serie || .movie => buildAnimeProps(),
        .novel => buildNovelProps(),
      };
      if (mediaInfo.hasError) return ErrorBuilder(message: mediaInfo.error, refresh: () {});
      return Skeletonizer(
        enabled: mediaInfo.isLoading,
        child: MediaPage(mediaInfos: mediaInfo, mediaProps: mediaProps),
      );
    },
  );
  MediaView buildAnimeProps() {
    final mediaState = _mediaController.animeState.value;
    final chapterState = _mediaController.episodesState.value;
    final anime = mediaState.value ?? _mediaController.fakeAnime;
    final chapters = chapterState.value ?? _mediaController.fakeEpisodes;
    final isSerie = widget.props.type.isSerie;
    final genres = anime.genres.map((e) => e.title.uz).toList();
    final categories = anime.categories.map((e) => e.name.uz).toList();
    final frames = SizedBox(
      height: 320,
      child: anime.images.isEmpty
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
              onTap: (value) => openImagePreveiwDialog(context, anime.images, value),
              children: anime.images.map((e) => Ink.image(fit: .cover, image: imageProviderFallback(addBaseUrl(e)))).toList(),
            ),
    );
    void openMedia(MediaChapter chapter) =>
        context.pushNamed("watch", queryParameters: MediaProps.fromAnime(anime, chapterKey: chapter.key).toJson());

    return .new(
      cover: anime.cover,
      thumbnail: anime.thumbnail,
      title: anime.title.uz,
      hasError: mediaState.hasError,
      isLoading: mediaState.isLoading,
      error: mediaState.error ?? "Nimadur xato ketti",
      views: [
        AnimeInfosMenu([
          Single("Anime haqida ma'lumot", anime.description.uz),
          MultiActions("Janrlar", genres),
          MultiActions("Kategoriya", categories, true),
          Custom("Animedan kadrlar", frames),
        ]),
        CommentsMenu(),
        CreatorsMenu(anime.creators.map((e) => (e.name, e.image)).toList()),
        if (isSerie)
          AnimeEpisodesMenu(
            total: chapters.length,
            chapters: chapters.map(MediaChapter.fromAnime).toList(),
            openChapter: openMedia,
          ),
      ],
      items: [
        MapEntry("Chiqarilgan yil:", "${anime.publishedYear}-yil"),
        MapEntry("Mamlakat:", anime.country?['name']?['uz'] ?? "NN"),
        MapEntry("Studia:", anime.studio?['name'] ?? "NN"),
      ],
      tabs: [
        Tab(text: "Ma'lumotlar"),
        Tab(text: "Izohlar"),
        Tab(text: "Ovoz beruvchilar"),
        if (isSerie) Tab(text: "Qismlar"),
      ],
    );
  }

  MediaView buildNovelProps() {
    final state = _bookController.novel.value;
    final chapterState = _bookController.chapters.value;
    final novel = state.value ?? _bookController.fakeNovel;
    final chapters = chapterState.value ?? _bookController.fakeChapters;
    final translators = Wrap(
      children: novel.translators
          .map(
            (e) => ActionChip(
              onPressed: () {},
              labelPadding: .all(20),
              avatar: CircleAvatar(foregroundImage: CachedNetworkImageProvider(e.picture), radius: 80),
              label: Text(e.firstName, style: context.textTheme.titleMedium),
            ),
          )
          .toList(),
    );
    return .new(
      cover: novel.thumbnail,
      thumbnail: novel.thumbnail,
      isLoading: state.isLoading,
      hasError: state.hasError,
      error: state.error ?? "Nimadur xato ketti",
      title: novel.title,
      items: [
        MapEntry("Chiqarilgan yili", DateTime.tryParse(novel.createdAt)?.formatFull() ?? ""),
        MapEntry("Holati", novel.translationStatus.name),
        MapEntry("Reyting", novel.averageRating.toDouble()),
      ],
      tabs: [
        Tab(text: "Ma'lumotlar"),
        Tab(text: "Boblar"),
      ],
      views: [
        AnimeInfosMenu([
          Single("Novella haqida ma'lumot", novel.description),
          if (novel.genres.isNotEmpty) MultiActions("Janrlar", novel.genres.map((e) => e.title).toList()),
          if (novel.categories.isNotEmpty) MultiActions("Kategoriya", novel.categories.map((e) => e.title).toList()),
          Custom("Tarjimonlar", translators),
        ]),
        AnimeEpisodesMenu(
          chapters: chapters.map(MediaChapter.fromBook).toList(),
          total: chapters.length,
          openChapter: (key) => print(key.key),
        ),
      ],
    );
  }

  MediaView buildMangaProps() {
    final state = _bookController.manga.value;
    final data = state.value ?? _bookController.fakeManga;
    final chapterState = _bookController.chapters.value;
    final chapters = chapterState.value ?? _bookController.fakeChapters;
    final translators = Wrap(
      children: data.translators
          .map(
            (e) => ActionChip(
              onPressed: () {},
              labelPadding: .all(20),
              avatar: CircleAvatar(foregroundImage: CachedNetworkImageProvider(e.picture), radius: 80),
              label: Text(e.firstName, style: context.textTheme.titleMedium),
            ),
          )
          .toList(),
    );

    return .new(
      isLoading: state.isLoading,
      hasError: state.hasError,
      error: state.error ?? "Nimadur xato ketti",
      cover: data.thumbnail,
      thumbnail: data.thumbnail,
      title: data.title,
      views: [
        AnimeInfosMenu([
          Single("${data.type} haqida ma'lumot", data.description),
          if (data.genres.isNotEmpty) MultiActions("Janrlar", data.genres.map((e) => e.title).toList()),
          if (data.categories.isNotEmpty) MultiActions("Kategoriya", data.categories.map((e) => e.title).toList()),
          Custom("Tarjimonlar", translators),
        ]),
        AnimeEpisodesMenu(
          chapters: chapters.map(MediaChapter.fromBook).toList(),
          total: chapters.length,
          openChapter: (key) => print(key.key),
        ),
      ],
      tabs: [
        Tab(text: "Ma'lumotlar"),
        Tab(text: "Boblar"),
      ],
      items: [
        MapEntry("Chiqarilgan yili", DateTime.tryParse(data.createdAt)?.formatFull() ?? ""),
        MapEntry("Holati", data.translationStatus.name),
        MapEntry("Reyting", data.averageRating.toDouble()),
      ],
    );
  }
}

void openErrorDialog(BuildContext context, {required void Function() refresh, required String error}) => showDialog(
  context: context,
  builder: (_) => Skeleton.ignore(
    ignore: true,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        decoration: BoxDecoration(color: context.appColors.surface.withAlpha(100)),
        width: 400,
        height: 400,
        child: ErrorBuilder(message: ErrorMessages.fromMessage(error), refresh: refresh),
      ),
    ),
  ),
);

void openImagePreveiwDialog(BuildContext context, List<String> images, int index) => showDialog(
  context: context,
  builder: (_) => ImagePreview(images, current: index),
);
