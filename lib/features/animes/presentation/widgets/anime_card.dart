import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AnimeCard extends StatelessWidget {
  final AnimeEntity anime;
  final bool? expand;
  const AnimeCard({super.key, required this.anime, this.expand});

  void _showCustomMenu(
    BuildContext context,
    Offset position, {
    required List<PopupMenuEntry<String>> items,
  }) {
    final RelativeRect positionRect = RelativeRect.fromLTRB(
      position.dx - 200,
      position.dy,
      MediaQuery.of(context).size.width - position.dx + 0,
      MediaQuery.of(context).size.height - position.dy,
    );

    showMenu<String>(context: context, position: positionRect, items: items, elevation: 8.0);
  }

  void handleClick(BuildContext context, Offset position) => _showCustomMenu(
    context,
    position,
    items: [
      PopupMenuItem(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(spacing: 10, children: [Icon(Icons.bookmark), Text("Saqlash")]),
      ),
      PopupMenuItem(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(spacing: 10, children: [Icon(Icons.bookmark), Text("Saqlash")]),
      ),
    ],
  );
  static double aspectRatio = 9 / 15;
  static double width = 150;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    return SizedBox(
      width: (expand != null && expand!) ? double.infinity : (isMobile ? 150 : 180),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
            child: GestureDetector(
              onSecondaryTapDown: (details) => handleClick(context, details.globalPosition),
              onLongPressStart: (details) => handleClick(context, details.globalPosition),
              child: InkWell(
                mouseCursor: SystemMouseCursors.click,
                borderRadius: BorderRadius.circular(15),
                onTap: () => context.pushNamed(
                  "anime",
                  pathParameters: {"type": anime.type, "slug": anime.slug},
                ),
                splashColor: context.appColors.surfaceContainerHigh.withValues(alpha: 0.2),
                hoverColor: context.appColors.surfaceContainerHigh.withValues(alpha: 0.2),
                highlightColor: Colors.transparent,
                focusColor: context.appColors.surfaceContainerHigh.withValues(alpha: 0.2),
                radius: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 12,
                      child: Ink(
                        decoration: !anime.thumbnail.endsWith(".avif")
                            ? BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: context.appColors.surfaceContainerLowest,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(addBaseUrl(anime.thumbnail)),
                                  fit: BoxFit.cover,
                                  alignment: AlignmentGeometry.center,
                                ),
                                borderRadius: BorderRadius.circular(14),
                              )
                            : BoxDecoration(
                                color: context.appColors.error,
                                borderRadius: BorderRadius.circular(14),
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                      child: Text(
                        toBeginningOfSentenceCase(anime.title.uz),
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
          ),
          Positioned(
            right: 7,
            top: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: context.appColors.primaryContainer.withAlpha(200),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "${anime.publishedYear}-yil",
                style: TextStyle(color: context.appColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
