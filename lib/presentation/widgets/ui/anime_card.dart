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
    return SizedBox(
      width: 250,
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: InkWell(
          onTapUp: (details) => context.pushNamed("anime", pathParameters: {'slug': widget.anime.slug ?? ""}),
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
                  child: Ink.image(fit: BoxFit.cover, image: NetworkImage(widget.anime.thumbnail ?? "")),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.anime.totalEpisodes} ta qism"),
                    InkResponse(
                      onTap: () {},
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(5),
                        child: Icon(Icons.menu, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
