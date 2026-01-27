import 'package:application/models/anime.dart';
import 'package:application/services/animes.dart';
import 'package:application/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';

class AnimesView extends StatefulWidget {
  const AnimesView({super.key});

  @override
  State<AnimesView> createState() => _AnimesViewState();
}

class _AnimesViewState extends State<AnimesView> {
  List<Anime>? _data;
  bool _loading = true;
  Future<void> fetchData() async {
    setState(() {
      _loading = true;
    });
    List<Anime> data = await FetchAnimes().post();
    setState(() {
      _data = data;
      _loading = false;
    });
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
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Builder(
          builder: (context) {
            if (_loading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            if (_data != null) {
              List<Anime> animes = _data as List<Anime>;
              return GridView.extent(
                maxCrossAxisExtent: 270,
                childAspectRatio: 6 / 8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                children: animes.map((anime) {
                  return WidgetAnimeCard(anime: anime);
                }).toList(),
              );
            }
            return Text("No data");
          },
        ),
      ),
    );
  }
}
