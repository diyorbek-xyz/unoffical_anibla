import 'package:application/data/models/anime.dart';
import 'package:application/data/repositories/animes_repo.dart';
import 'package:application/ui/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';

class AnimesView extends StatefulWidget {
  const AnimesView({super.key});

  @override
  State<AnimesView> createState() => _AnimesViewState();
}

class _AnimesViewState extends State<AnimesView> {
  final _repo = AnimesRepository();

  List<Anime>? _animes;
  bool _loading = true;
  String? _error;

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final animes = await _repo.getAll();
      if (!mounted) return;
      setState(() {
        _loading = false;
        _animes = animes;
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
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: GridView.extent(
              maxCrossAxisExtent: 270,
              childAspectRatio: 6 / 8,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              children: _animes!.map((anime) => WidgetAnimeCard(anime: anime)).toList(),
            ),
          );
        },
      ),
    );
  }
}
