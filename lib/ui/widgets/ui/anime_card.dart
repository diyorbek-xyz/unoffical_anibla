import 'package:application/data/models/anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetAnimeCard extends StatefulWidget {
  final Anime anime;
  const WidgetAnimeCard({super.key, required this.anime});
  @override
  State<StatefulWidget> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<WidgetAnimeCard> {
  bool _hover = false;
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: Duration(milliseconds: 50),
      scale: _active
          ? 0.98
          : _hover
          ? 1.04
          : 1,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        type: MaterialType.card,
        elevation: _hover ? 10 : 0,
        child: InkWell(
          onTapCancel: () => setState(() => _active = false),
          onTapDown: (details) => setState(() => _active = true),
          onTapUp: (details) {
            context.pushNamed("anime", pathParameters: {'id': widget.anime.id});
            setState(() => _active = false);
          },
          onHover: (value) => setState(() => _hover = value),
          splashColor: Colors.amberAccent.withValues(alpha: 0.1),
          hoverColor: Colors.amber.withValues(alpha: 0.05),
          focusColor: Colors.amber.withValues(alpha: 0.05),
          highlightColor: Colors.amber.withValues(alpha: 0.05),
          child: Ink.image(
            image: CachedNetworkImageProvider(widget.anime.thumbnail),
            fit: BoxFit.cover,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: _hover ? 100 : 80,
                  color: _hover ? Colors.white : Colors.black38,
                  padding: EdgeInsets.all(_hover ? 10 : 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.anime.title.uz,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: _hover ? Colors.black : Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
