import 'dart:ui';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/view_model/media_chapter.dart';
import 'package:application/features/anibla/data/view_model/media_view.dart';
import 'package:application/features/anibla/presentation/dialogs/image_preview.dart';
import 'package:application/features/anibla/presentation/pages/media_page.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:application/features/anibla/presentation/controllers/comment_controller.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/anibla/presentation/controllers/saved_controller.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/injection_container.dart';
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
    if (_bookController.book.hasError && widget.props.type.isNovel) {
      openErrorDialog(context, refresh: _bookController.refreshNewest, error: _bookController.book.error ?? "Nimadur xato ketti");
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
      final (isLoading, hasError, error, mediaInfo) = switch (widget.props.type) {
        .serie || .movie => buildAnimeProps(),
        _ => buildBookProps(),
      };
      if (hasError) return ErrorBuilder(message: error, refresh: () {});
      return Skeletonizer(
        enabled: isLoading,
        child: MediaPage(mediaInfos: mediaInfo, mediaProps: mediaProps),
      );
    },
  );

  (bool, bool, String, MediaView) buildAnimeProps() {
    final mediaState = _mediaController.animeState.value;
    final chaptersState = _mediaController.episodesState.value;
    final chapters = chaptersState.value ?? _mediaController.fakeEpisodes;
    final anime = mediaState.value ?? _mediaController.fakeAnime;
    final isLoading = mediaState.isLoading || chaptersState.isLoading;
    final hasError = mediaState.hasError || chaptersState.hasError;
    final error = mediaState.error ?? chaptersState.error ?? "Nimadur xato ketti";
    final infos = MediaView(
      chapters: chapters.map(MediaChapter.fromAnime).toList(),
      openMedia: (key) => context.pushNamed("watch", queryParameters: MediaProps.fromAnime(anime, chapterKey: key).toJson()),
      type: anime.type,
      cover: anime.cover,
      frames: anime.images,
      title: anime.title.uz,
      ageRestriction: anime.age,
      thumbnail: anime.thumbnail,
      releaseYear: anime.publishedYear,
      description: anime.description.uz,
      studio: anime.studio['name'].toString(),
      author: anime.director['name'].toString(),
      genres: Map.fromEntries(anime.genres.map((e) => MapEntry(e.id, e.title.uz))),
      translators: Map.fromEntries(anime.creators.map((e) => MapEntry(e.id, e.name))),
      categories: Map.fromEntries(anime.categories.map((e) => MapEntry(e.id, e.name.uz))),
    );
    return (isLoading, hasError, error, infos);
  }

  (bool, bool, String, MediaView) buildBookProps() {
    final bookState = _bookController.book.value;
    final chaptersState = _bookController.chapters.value;
    final book = bookState.value ?? _bookController.fakeBook;
    final chapters = chaptersState.value ?? _bookController.fakeChapters;
    final isLoading = bookState.isLoading || chaptersState.isLoading;
    final hasError = bookState.hasError || chaptersState.hasError;
    final error = bookState.error ?? chaptersState.error ?? "Nimadur xato ketti";
    final infos = MediaView(
      chapters: chapters.map(MediaChapter.fromBook).toList(),
      openMedia: (key) => context.pushNamed("read", queryParameters: widget.props.copyWith(chapterKey: key).toJson()),
      cover: book.thumbnail,
      thumbnail: book.thumbnail,
      title: book.title,
      views: book.viewsCount,
      ageRestriction: book.ageRestriction.tryParseInt() ?? 0,
      description: book.description,
      likes: book.likesCount,
      saves: book.bookmarkedCount,
      releaseYear: book.releaseYear,
      type: book.type,
      categories: Map.fromEntries(book.categories.map((e) => MapEntry(e.id, e.title))),
      genres: Map.fromEntries(book.genres.map((e) => MapEntry(e.id, e.title))),
      translators: Map.fromEntries(book.translators.map((e) => MapEntry(e.id, e.firstName))),
    );
    return (isLoading, hasError, error, infos);

    // final chapterState = _bookController.chapters.value;
    // final chapters = chapterState.value ?? _bookController.fakeChapters;
    // final translators = book.translators
    //     .map(
    //       (e) => ActionChip(
    //         onPressed: () {},
    //         labelPadding: .all(20),
    //         avatar: CircleAvatar(foregroundImage: CachedNetworkImageProvider(e.picture), radius: 80),
    //         label: Text(e.firstName, style: context.textTheme.titleMedium),
    //       ),
    //     )
    //     .toList();
    // // final items = [
    //   MapEntry("Chiqarilgan yili", DateTime.tryParse(book.createdAt)?.formatFull() ?? ""),
    //   MapEntry("Holati", book.translationStatus.name),
    //   MapEntry("Reyting", book.averageRating.toDouble()),
    // ];
    // final tabs = [Tab(text: "Ma'lumotlar"), Tab(text: "Boblar")];
    // final views = [
    //   AnimeInfosMenu([
    //     Single("Novella haqida ma'lumot", book.description),
    //     Multi("Tarjimonlar", translators),
    //     if (book.genres.isNotEmpty) MultiActions("Janrlar", book.genres.map((e) => e.title).toList()),
    //     if (book.categories.isNotEmpty) MultiActions("Kategoriya", book.categories.map((e) => e.title).toList()),
    //   ]),
    //   AnimeEpisodesMenu(
    //     chapters: chapters.map(MediaChapter.fromBook).toList(),
    //     total: chapters.length,
    //     openChapter: (key) => context.pushNamed("read", queryParameters: widget.props.copyWith(chapterKey: key.key).toJson()),
    //   ),
    // ];
  }
}

void openErrorDialog(BuildContext context, {required void Function() refresh, required String error}) => showDialog(
  context: context,
  builder: (_) => Skeleton.ignore(
    ignore: true,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        decoration: BoxDecoration(color: context.colors.surface.withAlpha(100)),
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
