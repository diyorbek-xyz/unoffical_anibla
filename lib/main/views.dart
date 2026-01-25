import 'package:application/services/animes.dart';
import 'package:application/services/models/anime.dart';
import 'package:application/widgets/layout/sidebar.dart';
import 'package:application/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';

class Views extends StatefulWidget {
  const Views({super.key});
  @override
  State<StatefulWidget> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  int _selectedIndex = 0;
  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetSidebar(selectedIndex: _selectedIndex, onDestinationSelected: _onDestinationSelected),
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: FutureBuilder<List<Anime>>(
                    future: FetchAnimes().get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
                        return CircularProgressIndicator.adaptive();
                      }
                      if (snapshot.hasData && snapshot.data != null) {
                        List<Anime> animes = snapshot.data as List<Anime>;
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
                Container(color: Colors.amber),
                Container(color: Colors.blue),
                Container(color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
