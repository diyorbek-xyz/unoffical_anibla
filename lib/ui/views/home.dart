import 'package:application/constants/colors.dart';
import 'package:application/data/models/anime.dart';
import 'package:application/data/models/filter.dart';
import 'package:application/data/repositories/animes_repo.dart';
import 'package:application/data/repositories/categories_repo.dart';
import 'package:application/ui/widgets/ui/calendar.dart';
import 'package:application/ui/widgets/ui/recommends.dart';
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
  final _repo = AnimesRepository();
  final _repoC = FilterRepository();

  List<Anime>? _carousel;
  List<Anime>? _calendar;
  List<Category>? _categories;
  bool _loading = true;
  String? _error;

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final carousel = await _repo.getCarousel();
      final calendar = await _repo.getCalender();
      final categories = await _repoC.getCategories();
      setState(() {
        _loading = false;
        _carousel = carousel;
        _calendar = calendar;
        _categories = categories;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => _load(),
      child: Builder(
        builder: (context) {
          if (_loading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (_error != null) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(_error!),
                  ElevatedButton.icon(onPressed: () => _load(), icon: Icon(Icons.replay_outlined), label: Text("Yanglilash")),
                ],
              ),
            );
          }

          return SingleChildScrollView(
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
                Column(children: _categories!.map((category) => WidgetRecommends(id: category.id)).toList()),
              ],
            ),
          );
        },
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
        child: SizedBox(height: 1000, child: WidgetCalendar(data: _calendar!)),
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
      items: _carousel!.map((anime) {
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
