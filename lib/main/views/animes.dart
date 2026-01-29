import 'package:application/boxes/boxes.dart';
import 'package:application/models/anime.dart';
import 'package:application/services/animes.dart';
import 'package:application/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';

class AnimesView extends StatefulWidget {
  const AnimesView({super.key});

  @override
  State<AnimesView> createState() => _AnimesViewState();
}

class _AnimesViewState extends State<AnimesView> {
  @override
  Widget build(BuildContext context) {
    List<Anime> animes = animesBox.values.cast<Anime>().toList();

    return RefreshIndicator.adaptive(
      onRefresh: () => FetchAnimes().getAll(),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: GridView.extent(
          maxCrossAxisExtent: 270,
          childAspectRatio: 6 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 15,
          children: animes.map((anime) => WidgetAnimeCard(anime: anime)).toList(),
        ),
      ),
    );
  }
}
