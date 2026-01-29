import 'package:application/provider/anime.dart';
import 'package:application/services/animes.dart';
import 'package:application/models/anime.dart';
import 'package:application/widgets/layout/responsive.dart';
import 'package:application/widgets/ui/comments.dart';
import 'package:application/widgets/ui/description.dart';
import 'package:application/widgets/ui/episode_selector.dart';
import 'package:application/widgets/ui/recommends.dart';
import 'package:application/widgets/ui/watch_video.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AnimePage extends StatefulWidget {
  final String id;
  const AnimePage({super.key, required this.id});
  @override
  State<StatefulWidget> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  bool _loading = true;

  WatchAnime? _data;

  Future<void> fetchEpisode() async {
    final data = await FetchAnime().get(widget.id);

    if (!mounted) return;
    setState(() {
      _data = data;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchEpisode();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimeProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () => fetchEpisode(),
          child: Builder(
            builder: (context) {
              if (_loading) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              if (_data != null) {
                WatchAnime data = _data as WatchAnime;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: ResponsiveOrientation(
                      maxWidth: 700,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 10,
                            children: [
                              WidgetWatchVideo(anime: data.anime, episode: data.series),
                              WidgetWatchInfo(data: data),
                              WidgetDescription(anime: data.anime),
                              WidgetComments(comments: data.comments),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            spacing: 15,
                            crossAxisAlignment: .start,
                            children: [
                              if (!data.anime.isMovie) WidgetEpisodeSelector(data: data),
                              WidgetRecommends(category: data.anime.categories[0]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Text("No data");
            },
          ),
        ),
      ),
    );
  }
}
