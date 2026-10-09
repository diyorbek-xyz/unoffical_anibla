import 'package:application/features/anibla/presentation/widgets/anime_card.dart';
import 'package:application/features/ma-no/data/models/manga.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final manga = mangaSample.map(Manga.fromJson).toList();
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 9 / 15,
        ),
        itemCount: manga.length,
        itemBuilder: (context, index) => MediaCard.fromManga(manga[index], expand: true),
      ),
    );
  }
}
