import 'package:application/constants/colors.dart';
import 'package:application/provider/anime.dart';
import 'package:application/models/anime.dart';
import 'package:application/widgets/ui/recomends.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetEpisodeSelector extends StatelessWidget {
  final WatchAnime data;
  const WidgetEpisodeSelector({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetHeader(title: "Barcha qismlar"),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 30, maxHeight: 230),
          child: Material(
            clipBehavior: Clip.hardEdge,
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                children: [
                  ...data.series.asMap().entries.map((e) {
                    return ListTile(
                      selected: e.key == context.watch<AnimeProvider>().episode,
                      selectedTileColor: primary,
                      selectedColor: Colors.white,
                      onTap: () => context.read<AnimeProvider>().changeEpisode(value: e.key),
                      title: Text(e.value.title.uz),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
