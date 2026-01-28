import 'package:application/constants/colors.dart';
import 'package:application/models/anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

class WidgetCarousel extends StatefulWidget {
  const WidgetCarousel({super.key, required this.data});
  final List<Anime> data;
  @override
  State<StatefulWidget> createState() => _WidgetCarousel();
}

class _WidgetCarousel extends State<WidgetCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 5),
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        enlargeFactor: 0.4,
        pageSnapping: true,
        height: 700,
      ),
      disableGesture: false,
      items: widget.data.map((anime) {
        final boxDecoration = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp,
            colors: [Colors.black54, Colors.transparent],
          ),
        );
        return GestureDetector(
          onTap: () => context.pushNamed('anime', pathParameters: {"id": anime.id}),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: CachedNetworkImageProvider(anime.poster), fit: BoxFit.cover),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: boxDecoration,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: animeInfo(anime),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  List<Widget> animeInfo(Anime anime) {
    return [
      CachedNetworkImage(imageUrl: anime.thumbnail, fit: BoxFit.cover, width: 180, height: 220),
      Text(
        anime.title.uz,
        maxLines: 2,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      Text(
        anime.description.uz,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white),
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: primary),
            child: Text("${anime.year}-yil"),
          ),
        ],
      ),
    ];
  }
}
