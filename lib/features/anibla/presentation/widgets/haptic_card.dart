import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/mano/data/models/main/book.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/presentation/controllers/saved_controller.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HapticCard extends StatefulWidget {
  final String id;
  final String title;
  final String thumbnail;
  final MediaType type;
  final void Function(BuildContext context) navigate;
  final bool? expand;
  final double? aspectRatio;
  final List<String>? badges;
  final String? progress;
  const HapticCard({
    required this.id,
    required this.navigate,
    required this.thumbnail,
    required this.title,
    required this.type,
    super.key,
    this.expand,
    this.aspectRatio,
    this.progress,
    this.badges = const [],
  });
  static double width = 150;

  @override
  State<HapticCard> createState() => _HapticCardState();

  factory HapticCard.fromAnime(Anime anime, {bool? expand, double? aspectRatio, List<String>? badges}) => HapticCard(
    id: anime.id,
    thumbnail: anime.thumbnail,
    title: anime.title.uz,
    type: anime.type,
    navigate: (c) => c.pushNamed("media", queryParameters: MediaProps.fromAnime(anime).toJson()),
    badges: badges,
    progress: (anime.type.isMovie || anime.totalEpisodes == 0)
        ? null
        : anime.availableEpisodes >= anime.totalEpisodes
        ? "Barcha qismlar"
        : "${anime.availableEpisodes} - ${anime.totalEpisodes}",
  );
  factory HapticCard.fromManga(Book manga, {bool? expand, double? aspectRatio, List<String>? badges}) => HapticCard(
    id: manga.id,
    thumbnail: manga.thumbnail,
    title: manga.title,
    type: manga.type,
    navigate: (c) => c.pushNamed("media", queryParameters: MediaProps.fromBook(manga).toJson()),
    badges: badges,
    progress: "${manga.chaptersCount} Bob",
  );
}

class _HapticCardState extends State<HapticCard> {
  late final LocalAnimesController savedController;
  bool isSaved = false;
  void save() {
    setState(() => isSaved = !isSaved);
    savedController.saveMedia(widget.id, widget.type);
  }

  void handleClick(BuildContext context, Offset position, double space) {
    setState(() => isSaved = savedController.isThisSaved(widget.id));
    final overlay = (Overlay.of(context).context.findRenderObject() as RenderBox).size;
    final screen = MediaQuery.sizeOf(context);
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx - (screen.width - overlay.width) + space,
        position.dy + space,
        screen.width - position.dx + space,
        screen.height - position.dy + space,
      ),
      items: [
        PopupMenuItem(
          // height: 45,
          padding: EdgeInsets.symmetric(horizontal: 15),
          onTap: save,
          child: Row(
            spacing: 10,
            children: [Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline), Text(isSaved ? "Olib tashlash" : "Saqlash")],
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  @override
  void initState() {
    super.initState();
    savedController = sl();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final badges = [
      if (widget.badges != null) ...widget.badges!,
      widget.type.toString(),
      if (widget.progress != null) widget.progress,
    ].cast<String>().toList();

    final cover = InkWell(
      mouseCursor: SystemMouseCursors.click,
      borderRadius: BorderRadius.circular(15),
      onTap: () => widget.navigate(context),
      radius: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          AspectRatio(
            aspectRatio: 9 / 12,
            child: Ink(
              decoration: isUsable(widget.thumbnail)
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: context.appColors.surfaceContainerLowest, blurRadius: 4, offset: Offset(0, 2)),
                      ],
                      image: DecorationImage(
                        isAntiAlias: true,
                        image: imageProviderFallback(addBaseUrl(widget.thumbnail)),
                        fit: BoxFit.cover,
                        alignment: AlignmentGeometry.center,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    )
                  : BoxDecoration(color: context.appColors.errorContainer, borderRadius: BorderRadius.circular(14)),
              padding: .all(3),
              child: Column(
                crossAxisAlignment: .end,
                mainAxisAlignment: .end,
                spacing: 2,
                children: badges.asMap().entries.map((e) => badge(e.value, e.key + 1, badges.length)).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
            child: Text(
              toBeginningOfSentenceCase(widget.title),
              maxLines: isMobile ? 1 : 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );

    return CupertinoContextMenu(
      enableHapticFeedback: true,
      actions: [
        TextButton.icon(
          onPressed: () {},
          icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
          label: Text(isSaved ? "Olib tashlash" : "Saqlash"),
        ),
      ],
      child: Material(
        child: Ink(
          width: (widget.expand != null && widget.expand!) ? double.infinity : (isMobile ? 150 : 180),
          child: (widget.expand == null || !widget.expand! || widget.aspectRatio != null)
              ? AspectRatio(aspectRatio: widget.aspectRatio ?? 9 / 15, child: cover)
              : cover,
        ),
      ),
    );
  }

  Ink badge(String text, int index, int total) {
    final inner = Radius.circular(0);
    final outer = Radius.circular(100);
    final isFirst = index == 1 && total != 1;
    final isMiddle = index > 1 && index < total;
    final isLast = index == total && total != 1;
    final bFirst = isFirst ? inner : null;
    final bMiddle = isMiddle ? inner : null;
    final bLast = isLast ? outer : null;
    final tFirst = isFirst ? outer : null;
    final tMiddle = isMiddle ? inner : null;
    final tLast = isLast ? inner : null;
    return Ink(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: .only(
            bottomLeft: outer,
            topLeft: outer,
            bottomRight: bFirst ?? bMiddle ?? bLast ?? outer,
            topRight: tFirst ?? tMiddle ?? tLast ?? outer,
          ),
        ),
        color: context.appColors.primaryContainer.withAlpha(220),
      ),
      padding: .symmetric(vertical: 1.5, horizontal: 10),
      child: Text(text, style: context.textTheme.labelLarge?.copyWith(color: context.appColors.onPrimaryContainer)),
    );
  }
}
