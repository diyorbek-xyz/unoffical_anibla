import 'package:application/constants/colors.dart';
import 'package:application/models/anime.dart';
import 'package:application/widgets/ui/episode_selector.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void _showMyModalBottomSheet(BuildContext context, WatchAnime data) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(height: 200, width: 300, child: WidgetEpisodeSelector(data: data));
    },
  );
}

class WidgetControls extends StatelessWidget {
  final void Function() openModal;
  const WidgetControls({super.key, required this.openModal});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 10,
      children: [
        if (width < 600)
          TextButton(
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryTint), padding: WidgetStatePropertyAll(EdgeInsets.all(15))),
            onPressed: () => openModal(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Text('Qismlar', style: TextStyle(fontSize: 17, color: primaryDark)),
                Icon(Icons.menu_rounded, size: 25, color: primaryDark),
              ],
            ),
          ),

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
    );
  }
}

class WidgetWatchInfo extends StatelessWidget {
  final WatchAnime data;
  const WidgetWatchInfo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Anime anime = data.anime;
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
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
                Text(anime.studio, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                Text(anime.director),
              ],
            ),
          ],
        ),
        WidgetControls(openModal: () => _showMyModalBottomSheet(context, data)),
      ],
    );
  }
}

class WidgetWatchVideo extends StatelessWidget {
  final Anime anime;
  final Series episode;
  const WidgetWatchVideo({super.key, required this.anime, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        Center(
          child: Container(
            height: 450,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: anime.thumbnail, fit: BoxFit.cover),
                imageUrl: anime.poster,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  return Center(child: CircularProgressIndicator.adaptive(value: progress.progress));
                },
              ),
            ),
          ),
        ),
        SelectableText("${episode.title.uz} ${anime.title.uz}", style: TextStyle(fontSize: 23)),
      ],
    );
  }
}
