import 'package:application/presentation/model/anime_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WidgetAnimeCard extends StatefulWidget {
  final AnimeUiModel anime;
  const WidgetAnimeCard({super.key, required this.anime});
  @override
  State<StatefulWidget> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<WidgetAnimeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: AspectRatio(aspectRatio: 9 / 16, child: _cardDatas(context)),
    );
  }

  InkWell _cardDatas(BuildContext context) {
    return InkWell(
      mouseCursor: WidgetStateMouseCursor.clickable,
      onTapUp: (details) => context.pushNamed("anime", pathParameters: {'slug': widget.anime.slug}),
      splashColor: Colors.amberAccent.withValues(alpha: 0.1),
      hoverColor: Colors.amber.withValues(alpha: 0.05),
      focusColor: Colors.amber.withValues(alpha: 0.05),
      highlightColor: Colors.amber.withValues(alpha: 0.05),
      child: Padding(
        padding: EdgeInsetsGeometry.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Skeleton.replace(replace: widget.anime.thumbnail == "thumbnail", child: _inkImage(widget.anime.thumbnail)),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 6),
              child: Text(
                widget.anime.title.uz,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, height: 1, color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.anime.totalEpisodes} ta qism"),
                InkResponse(
                  onTap: () {},
                  mouseCursor: WidgetStateMouseCursor.clickable,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: PopupMenuButton(
                    offset: Offset(0, -130),
                    tooltip: "",
                    position: PopupMenuPosition.over,
                    icon: Icon(Icons.menu, color: Colors.white),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(color: Colors.white, Icons.bookmark_add),
                              Text('Saqlash'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(color: Colors.white, Icons.remove_red_eye_outlined),
                              Text('Ko\'rilgan deb belgilash'),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _inkImage(String? image) {
    if (image == null || image.endsWith(".avif")) {
      return Center(child: Text("Invalid image"));
    }
    return Ink.image(fit: BoxFit.cover, image: CachedNetworkImageProvider(image));
  }
}
