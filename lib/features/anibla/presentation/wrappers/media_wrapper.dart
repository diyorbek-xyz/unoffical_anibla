import 'dart:ui';
import 'package:application/features/anibla/presentation/dialogs/image_preview.dart';
import 'package:material_ui/material_ui.dart';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:skeletonizer/skeletonizer.dart';

// class MediaWrapper extends StatefulWidget {
//   final MediaProps props;
//   const MediaWrapper(this.props, {super.key});

//   @override
//   State<MediaWrapper> createState() => _MediaWrapperState();
// }

// class _MediaWrapperState extends State<MediaWrapper> {
//   late final LocalAnimesController? _savedController;
//   late final AnimeController _mediaController;
//   late final BookController _bookController;
//   late final CommentController _commentController;
//   late final EffectCleanup _errorDialogCleanup;
//   EffectCleanup? _commentsCleanup;
//   bool isSaved = false;

//   void toggleSave(String id) {
//     _savedController?.saveMedia(id, widget.props.type);
//     setState(() => isSaved = !isSaved);
//   }

//   void errorHandler() {
//     if (_bookController.book.hasError && widget.props.type.isNovel) {
//       openErrorDialog(context, refresh: _bookController.refreshNewest, error: _bookController.book.error ?? "Nimadur xato ketti");
//     }
//     if (_mediaController.animeState.hasError && widget.props.type.isAnime) {
//       openErrorDialog(
//         context,
//         refresh: _mediaController.refreshFullAnime,
//         error: _mediaController.animeState.error ?? "Nimadur xato ketti",
//       );
//     }
//   }

//   void getMedia() async {
//     if (widget.props.type.isAnime) return await _mediaController.getFullAnime(widget.props.type, widget.props.mediaKey);
//     if (widget.props.type.isBook) return await _bookController.getFullBook(widget.props.type, widget.props.mediaKey);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _bookController = sl<BookController>();
//     _mediaController = sl<AnimeController>();
//     _commentController = sl<CommentController>();
//     _errorDialogCleanup = effect(errorHandler);
//     getMedia();
//     if (widget.props.type.isBook) return;
//     _savedController = sl<LocalAnimesController>();
//     _commentsCleanup = _mediaController.animeState.subscribe((value) {
//       if (value.hasValue) _commentController.getAnimeComments(20);
//     });
//   }

//   @override
//   void dispose() {
//     _mediaController.resetMedia();
//     _commentController.resetAll();
//     _commentsCleanup?.call();
//     _errorDialogCleanup();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => SignalBuilder(
//     builder: (context) {
//       final mediaProps = widget.props;
//       final (state, view) = switch (widget.props.type) {
//         .serie || .movie => buildAnimeProps(),
//         _ => buildBookProps(),
//       };
//       if (state.hasMediaError) return ErrorBuilder(message: state.mediaError, refresh: getMedia);
//       return Skeletonizer(
//         enabled: state.isMediaLoading,
//         ignoreContainers: true,
//         child: Provider.multi(
//           providers: [
//             Provider<MediaState>(value: state),
//             Provider<MediaView>(value: view),
//           ],
//           child: MediaPage(mediaInfos: view, mediaProps: mediaProps, mediaState: state),
//         ),
//       );
//     },
//   );

//   (MediaState, MediaView) buildAnimeProps() {
//     final mediaState = _mediaController.animeState.value;
//     final anime = mediaState.value ?? _mediaController.fakeAnime;
//     final infos = MediaView.fromAnime(anime.copyWith(thumbnail: widget.props.thumbnail));
//     final state = MediaState(
//       hasMediaError: mediaState.hasError,
//       isMediaLoading: mediaState.isLoading,
//       hasChaptersError: false,
//       isChaptersLoading: false,
//       chaptersError: "Nimadur xato ketti",
//       mediaError: mediaState.error ?? "Nimadur xato ketti",
//     );

//     return (state, infos);
//   }

//   (MediaState, MediaView) buildBookProps() {
//     final bookState = _bookController.book.value;
//     final book = (bookState.value ?? _bookController.fakeBook).copyWith(thumbnail: widget.props.thumbnail);
//     final infos = MediaView.fromBook(book);
//     final state = MediaState(
//       hasMediaError: bookState.hasError,
//       isMediaLoading: bookState.isLoading,
//       hasChaptersError: false,
//       isChaptersLoading: false,
//       mediaError: bookState.error ?? "Nimadur xato ketti",
//       chaptersError: "Nimadur xato ketti",
//     );

//     return (state, infos);
//   }
// }

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
