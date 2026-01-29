import 'package:application/boxes/boxes.dart';
import 'package:application/models/category.dart';
import 'package:application/models/filtered.dart';
import 'package:application/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';

class WidgetRecommends extends StatefulWidget {
  final Category category;
  const WidgetRecommends({super.key, required this.category});

  @override
  State<WidgetRecommends> createState() => _WidgetRecommendsState();
}

class _WidgetRecommendsState extends State<WidgetRecommends> {
  @override
  Widget build(BuildContext context) {
    CategoryFiltered? filtered = categoryFilteredBox.get(widget.category.id);
    return Builder(
      builder: (context) {
        if (filtered == null) {
          return Center(child: Text("No Data"));
        }
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(filtered.category.title.uz, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right)),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: filtered.animes
                        .map(
                          (anime) => SizedBox(
                            height: 280,
                            child: AspectRatio(
                              aspectRatio: 6 / 9,
                              child: WidgetAnimeCard(anime: anime),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
