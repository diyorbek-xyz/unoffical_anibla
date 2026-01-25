import 'package:application/datas/colors.dart';
import 'package:application/services/animes.dart';
import 'package:application/services/models/anime.dart';
import 'package:application/widgets/ui/description.dart';
import 'package:flutter/material.dart';

class AnimePage extends StatelessWidget {
  final String id;
  const AnimePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: FetchAnime().get(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
            return CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasData && snapshot.data != null) {
            WatchAnime data = snapshot.data as WatchAnime;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 10,
                        children: [
                          Container(
                            height: 450,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(data.anime.poster, fit: BoxFit.cover),
                          ),
                          SelectableText(data.anime.title.uz, style: TextStyle(fontSize: 23)),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            crossAxisAlignment: .end,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                    child: Image.asset('assets/images/avatar.png', height: 50),
                                  ),
                                  Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(data.anime.studio, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                                      Text(data.anime.director),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 10,
                                children: [
                                  IconButton(
                                    color: primaryDark,
                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryTint)),
                                    onPressed: () {},
                                    icon: Icon(Icons.heart_broken),
                                  ),
                                  IconButton(
                                    color: primaryDark,
                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryTint)),
                                    onPressed: () {},
                                    icon: Icon(Icons.share),
                                  ),
                                  IconButton(
                                    color: primaryDark,
                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryTint)),
                                    onPressed: () {},
                                    icon: Icon(Icons.bookmark_outline),
                                  ),
                                  IconButton(
                                    color: primaryDark,
                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryTint)),
                                    onPressed: () {},
                                    icon: Icon(Icons.download_outlined),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          WidgetDescription(anime: data.anime),
                          SizedBox(
                            height: 100,
                            child: Row(
                              spacing: 10,
                              crossAxisAlignment: .start,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                  child: Image.asset('assets/images/avatar.png', height: 60),
                                ),
                                Expanded(child: TextField(maxLength: 100, minLines: 1, maxLines: 3)),
                                IconButton(onPressed: () {}, icon: Icon(Icons.message)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 3, child: Container(color: Colors.amber, height: 100)),
                  ],
                ),
              ),
            );
          }
          return Text("No data");
        },
      ),
    );
  }
}
