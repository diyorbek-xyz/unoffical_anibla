import 'package:application/boxes/boxes.dart';
import 'package:application/constants/colors.dart';
import 'package:application/models/anime.dart';
import 'package:application/widgets/ui/description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WidgetCalendar extends StatefulWidget {
  const WidgetCalendar({super.key});

  @override
  State<WidgetCalendar> createState() => _WidgetCalendarState();
}

class _WidgetCalendarState extends State<WidgetCalendar> {
  @override
  Widget build(BuildContext context) {
    List<Anime> animes = animesBox.values.toList();

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
            child: Column(spacing: 15, children: animes.map((anime) => calenderCard(anime)).toList()),
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
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: CachedNetworkImage(imageUrl: anime.thumbnail, fit: BoxFit.cover),
            ),
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
