import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/controller/saved_controller.dart';
import 'package:application/features/common/presentation/widgets/tv_focuser.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimeCard extends StatefulWidget {
  final AnimeEntity anime;
  final bool? expand;
  final double? aspectRatio;
  const AnimeCard({required this.anime, super.key, this.expand, this.aspectRatio});

  static double width = 150;

  @override
  State<AnimeCard> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<AnimeCard> {
  late final SavedController savedController;
  bool isSaved = false;
  void save() {
    setState(() => isSaved = !isSaved);
    savedController.saveMedia(widget.anime.id, widget.anime.type);
  }

  void _showCustomMenu(BuildContext context, Offset position, {required List<PopupMenuEntry<String>> items}) {
    final RelativeRect positionRect = RelativeRect.fromLTRB(
      position.dx - 170,
      position.dy,
      MediaQuery.of(context).size.width - position.dx + 0,
      MediaQuery.of(context).size.height - position.dy,
    );

    showMenu<String>(context: context, position: positionRect, items: items, elevation: 8.0);
  }

  void handleClick(BuildContext context, Offset position) {
    setState(() => isSaved = savedController.isSaved(widget.anime.id));
    _showCustomMenu(
      context,
      position,
      items: [
        PopupMenuItem(
          height: 45,
          padding: EdgeInsets.symmetric(horizontal: 15),
          onTap: save,
          child: Row(spacing: 10, children: [Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline), Text(isSaved ? "Olib tashlash" : "Saqlash")]),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    savedController = sl();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    final cover = GestureDetector(
      onSecondaryTapDown: (details) => handleClick(context, details.globalPosition),
      onLongPressStart: (details) => handleClick(context, details.globalPosition),
      child: TvFocuser(
        builder: (node) => InkWell(
          focusNode: node,
          mouseCursor: SystemMouseCursors.click,
          borderRadius: BorderRadius.circular(15),
          onTap: () => context.pushNamed("anime", pathParameters: {"type": widget.anime.type.name, "slug": widget.anime.slug}),
          highlightColor: Colors.transparent,
          splashColor: context.appColors.primaryContainer.withAlpha(50),
          hoverColor: context.appColors.primaryContainer.withAlpha(50),
          focusColor: context.appColors.onPrimaryContainer.withAlpha(50),
          radius: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              AspectRatio(
                aspectRatio: 9 / 12,
                child: Ink(
                  decoration: (!widget.anime.thumbnail.endsWith(".avif") && widget.anime.thumbnail.isNotEmpty)
                      ? BoxDecoration(
                          boxShadow: [BoxShadow(color: context.appColors.surfaceContainerLowest, blurRadius: 4, offset: Offset(0, 2))],
                          image: DecorationImage(
                            isAntiAlias: true,
                            image: CachedNetworkImageProvider(addBaseUrl(widget.anime.thumbnail)),
                            fit: BoxFit.cover,
                            alignment: AlignmentGeometry.center,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        )
                      : BoxDecoration(color: context.appColors.primaryContainer, borderRadius: BorderRadius.circular(14)),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                child: Text(
                  toBeginningOfSentenceCase(widget.anime.title.uz),
                  maxLines: isMobile ? 1 : 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return SizedBox(
      width: (widget.expand != null && widget.expand!) ? double.infinity : (isMobile ? 150 : 180),
      child: Stack(
        children: [
          (widget.expand == null || !widget.expand! || widget.aspectRatio != null)
              ? AspectRatio(aspectRatio: widget.aspectRatio ?? 9 / 15, child: cover)
              : cover,

          Positioned(
            right: 7,
            top: 5,
            child: Skeleton.ignore(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(color: context.appColors.primaryContainer.withAlpha(200), borderRadius: BorderRadius.circular(6)),
                child: Text("${widget.anime.publishedYear}-yil", style: TextStyle(color: context.appColors.primary)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
