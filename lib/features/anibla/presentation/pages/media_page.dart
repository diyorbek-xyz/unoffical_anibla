import 'dart:ui';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/view_model/media_view.dart';
import 'package:application/features/anibla/presentation/widgets/media_page_hero.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        headerSliverBuilder: (_, _) => [
          MediaPageHero(
            isSaved: false,
            items: mediaInfos.items,
            tabs: mediaInfos.tabs,
            thumbnail: mediaInfos.thumbnail,
            title: mediaInfos.title,
          ),
        ],
        body: TabBarView(children: mediaInfos.views),
      ),
    ),
  );
}

void openErrorDialog(BuildContext context, {required void Function() refresh, required String error}) => showDialog(
  context: context,
  builder: (_) => Skeleton.ignore(
    ignore: true,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        decoration: BoxDecoration(color: context.appColors.surface.withAlpha(100)),
        width: 400,
        height: 400,
        child: ErrorBuilder(message: ErrorMessages.fromMessage(error), refresh: refresh),
      ),
    ),
  ),
);
