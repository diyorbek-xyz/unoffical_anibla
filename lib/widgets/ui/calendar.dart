import 'package:application/constants/colors.dart';
import 'package:application/models/anime.dart';
import 'package:application/services/animes.dart';
import 'package:application/widgets/ui/description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WidgetCalendar extends StatefulWidget {
  const WidgetCalendar({super.key});

  @override
  State<WidgetCalendar> createState() => _WidgetCalendarState();
}

class _WidgetCalendarState extends State<WidgetCalendar> {
  List<Anime>? _data;
  bool _loading = true;

  Future<void> fetchData() async {
    List<Anime> anime = await FetchAnimes(limit: 4).post();
    setState(() {
      _loading = false;
      _data = anime;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_left)),
                Text('Bugun', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right)),
              ],
            ),
            SizedBox(
              width: 100,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Builder(
              builder: (context) {
                if (_loading) {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
                if (_data != null) {
                  List<Anime> animes = _data as List<Anime>;
                  return Column(spacing: 5, children: animes.map((anime) => calenderCard(anime)).toList());
                }
                return Text('No Data');
              },
            ),
          ),
        ),
      ],
    );
  }

  SizedBox calenderCard(Anime anime) {
    return SizedBox(
      height: 200,
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 6 / 8,
            child: CachedNetworkImage(imageUrl: anime.thumbnail, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.title.uz,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      info("Chiqarilgan yili:", anime.year.toString()),
                      info("Ko'rishlar soni:", compact.format(anime.views)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("10:50", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("1-qism", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row info(String title, String value) {
    return Row(
      spacing: 4,
      children: [
        Container(width: 5, height: 20, color: primaryDark),
        Text(title),
        Text(value),
      ],
    );
  }
}
