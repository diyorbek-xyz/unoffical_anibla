import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetAnimeCard extends StatefulWidget {
  final AnimeEntity anime;
  const WidgetAnimeCard({super.key, required this.anime});
  @override
  State<StatefulWidget> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<WidgetAnimeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapUp: (details) => context.pushNamed("anime", pathParameters: {'slug': widget.anime.slug ?? ""}),
      splashColor: Colors.amberAccent.withValues(alpha: 0.1),
      hoverColor: Colors.amber.withValues(alpha: 0.05),
      focusColor: Colors.amber.withValues(alpha: 0.05),
      highlightColor: Colors.amber.withValues(alpha: 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 6 / 7,
            child: Ink.image(fit: BoxFit.cover, image: AssetImage('assets/images/poster.png')),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 6),
            child: Text(
              widget.anime.title?.uz ?? "title",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, height: 1, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.anime.totalEpisodes} ta qism"),
                InkResponse(
                  onTap: () {},
                  containedInkWell: true,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 10, left: 10),
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
