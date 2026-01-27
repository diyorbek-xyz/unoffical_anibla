import 'package:application/services/animes.dart';
import 'package:application/models/anime.dart';
import 'package:application/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';

class WidgetHeader extends StatelessWidget {
  final String title;
  const WidgetHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold));
  }
}

class WidgetRecommends extends StatefulWidget {
  final String header;
  final String? category;
  const WidgetRecommends({super.key, this.category = '653f7b1380692ab4bfe9148f', required this.header});
  @override
  State<StatefulWidget> createState() => _WidgetRecommendsState();
}

class _WidgetRecommendsState extends State<WidgetRecommends> {
  List<Anime>? _animes;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchAnimes();
  }

  Future<void> fetchAnimes() async {
    final data = await FetchAnimes().post(id: widget.category);

    if (!mounted) return;

    setState(() {
      _animes = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          WidgetHeader(title: widget.header),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Builder(
              builder: (context) {
                if (_loading) {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
                if (_animes != null) {
                  List<Anime> animes = _animes as List<Anime>;
                  return Row(
                    spacing: 10,
                    children: animes
                        .map(
                          (anime) => SizedBox(
                            width: 160,
                            child: AspectRatio(
                              aspectRatio: 6 / 9,
                              child: WidgetAnimeCard(anime: anime),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return Text('No Data');
              },
            ),
          ),
        ],
      ),
    );
  }
}
