import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/view_model/media_view.dart';
import 'package:application/features/anibla/presentation/widgets/media_page_hero.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MediaPage extends StatelessWidget {
  final MediaProps mediaProps;
  final MediaView mediaInfos;
  const MediaPage({super.key, required this.mediaInfos, required this.mediaProps});

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: mediaInfos.views.length,
    child: Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "media",
        shape: CircleBorder(),
        onPressed: () => context.pushNamed("watch", queryParameters: mediaProps.toJson()),
        child: Icon(Icons.play_arrow),
      ),
      body: NestedScrollView(
        clipBehavior: Clip.hardEdge,
        headerSliverBuilder: (_, isScrolled) => [
          MediaPageHero(
            isSaved: false,
            tabs: mediaInfos.tabs,
            isScrolled: isScrolled,
            items: mediaInfos.items,
            title: mediaInfos.title,
            thumbnail: mediaInfos.thumbnail,
          ),
        ],
        body: TabBarView(children: mediaInfos.views),
      ),
    ),
  );
}