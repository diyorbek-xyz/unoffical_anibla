import 'package:application/features/anibla/presentation/widgets/anime_card.dart';
import 'package:application/features/ma-no/data/models/manga.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/utils/url_launcher.dart';
import 'package:application/shared/widgets/recommend.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MangaPage extends StatelessWidget {
  const MangaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: .startFloat,
      floatingActionButton: FloatingActionButton(heroTag: "manga", onPressed: () {}, child: Icon(Icons.book)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            banner(context),
            Recommends(
              title: "Yangi Asarlar",
              onMoreClick: () {},
              items: List.generate(10, (index) => MediaCard.fromManga(Manga.fromJson(manga))),
            ),
            Recommends(
              title: "Top manga",
              onMoreClick: () {},
              items: List.generate(10, (index) => MediaCard.fromManga(Manga.fromJson(manga))),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox banner(BuildContext context) => SizedBox(
    height: context.isMobile ? 300 : 500,
    child: CarouselView.weighted(
      flexWeights: [1],
      padding: .all(0),
      itemSnapping: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.vertical(bottom: .circular(30))),
      infinite: true,
      onTap: (value) => openLink("https://ma-no.uz/no"),
      children: List.generate(
        3,
        (index) => CachedNetworkImage(
          fit: .cover,
          imageUrl:
              "https://s3.twcstorage.ru/57c0dcdb-5ea6cb33-0068-420d-96b8-28ab9ac337d9/76004421-a096-4370-9d7b-2211a5085bb0.jpeg",
        ),
      ),
    ),
  );
}
