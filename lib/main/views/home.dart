import 'package:application/boxes/boxes.dart';
import 'package:application/constants/colors.dart';
import 'package:application/models/anime.dart';
import 'package:application/models/category.dart';
import 'package:application/services/animes.dart';
import 'package:application/widgets/ui/calendar.dart';
import 'package:application/widgets/ui/recommends.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Anime> carousel = carouselBox.values.toList();
  List<Category> categories = categoriesBox.values.toList();

  Future<void> fetchData() async {
    for (Category category in categories) {
      await FetchAnimes().filter(category);
    }
    await FetchCarousel().get();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => fetchData(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 1000) {
                  return SizedBox(
                    height: 1000,
                    child: Column(spacing: 20, crossAxisAlignment: CrossAxisAlignment.start, children: hero(1, 1, true)),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 500,
                    child: Row(spacing: 20, crossAxisAlignment: CrossAxisAlignment.start, children: hero(5, 3, false)),
                  );
                }
              },
            ),
            Column(children: categories.map((category) => WidgetRecommends(category: category)).toList()),
          ],
        ),
      ),
    );
  }

  List<Widget> hero(int carouselFlex, int calendarFlex, bool ismobile) {
    return [
      Expanded(
        flex: carouselFlex,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(ismobile ? 0 : 15)),
          child: carouselWidget(),
        ),
      ),
      Expanded(
        flex: calendarFlex,
        child: SizedBox(height: 1000, child: WidgetCalendar()),
      ),
    ];
  }

  Widget carouselWidget() {
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
        scrollPhysics: CarouselScrollPhysics(),
      ),
      disableGesture: true,
      items: carousel.map((anime) {
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
