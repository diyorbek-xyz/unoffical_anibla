import 'package:application/models/anime.dart';
import 'package:application/services/animes.dart';
import 'package:application/widgets/ui/calendar.dart';
import 'package:application/widgets/ui/carousel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Anime>? _carousel;
  bool _loading = true;

  Future<void> fetchCarousel() async {
    List<Anime> anime = await FetchCarousel().get();
    setState(() {
      _loading = false;
      _carousel = anime;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCarousel();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => fetchCarousel(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 1000) {
                  return SizedBox(
                    height: 1000,
                    child: Column(spacing: 20, crossAxisAlignment: CrossAxisAlignment.start, children: hero(1, 1)),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 500,
                    child: Row(spacing: 20, crossAxisAlignment: CrossAxisAlignment.start, children: hero(5, 3)),
                  );
                }
              },
            ),
            Text('more animes'),
          ],
        ),
      ),
    );
  }

  List<Widget> hero(int carousel, int calendar) {
    return [
      Expanded(
        flex: carousel,
        child: Builder(
          builder: (context) {
            if (_loading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            if (_carousel != null) {
              List<Anime> carousel = _carousel as List<Anime>;
              return WidgetCarousel(data: carousel);
            }
            return Text('no data');
          },
        ),
      ),
      Expanded(
        flex: calendar,
        child: SizedBox(height: 1000, child: WidgetCalendar()),
      ),
    ];
  }
}
