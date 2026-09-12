import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/common/presentation/image_provider/fallback_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCard extends StatefulWidget {
  final AnimeEntity anime;
  final bool hasGenre;
  final double aspectRatio;
  final bool? expand;
  final String? extra;
  const HorizontalCard({super.key, required this.anime, this.aspectRatio = 16 / 9, this.expand, this.hasGenre = true, this.extra});

  static double width = 230;

  @override
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      borderRadius: BorderRadius.circular(15),
      onTap: () {},
      //  => context.pushNamed(
      //   "anime",
      //   queryParameters: AnimePageProps(animeType: widget.anime.type, animeSlug: widget.anime.slug).toJson(),
      // ),
      radius: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Ink(
            height: 160 / widget.aspectRatio,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: context.appColors.surfaceContainerLowest, blurRadius: 4, offset: Offset(0, 2))],
              image: DecorationImage(
                isAntiAlias: true,
                image: imageProviderFallback(addBaseUrl(widget.anime.cover)),
                fit: BoxFit.cover,
                alignment: AlignmentGeometry.center,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(5),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 2,
              children: [
                Text(
                  toBeginningOfSentenceCase(widget.anime.title.uz),
                  maxLines: (widget.hasGenre || (widget.extra != null)) ? 1 : 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
                if (widget.hasGenre || (widget.extra != null))
                  Text(
                    widget.hasGenre ? toBeginningOfSentenceCase(widget.anime.genres.map((e) => e.title.uz).join(", ")) : widget.extra!,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: context.appColors.onSurface.withAlpha(150)),
                  ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(widget.anime.createdAt.formatCompact()),
                    IconButton(onPressed: () {}, iconSize: 16, constraints: BoxConstraints.tightFor(height: 40, width: 40), icon: Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
