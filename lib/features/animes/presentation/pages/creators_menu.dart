import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CreatorsMenu extends StatelessWidget {
  final AnimeEntity anime;
  const CreatorsMenu({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: CustomScrollView(
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

            SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                final creator = anime.creators.elementAt(index);
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(creator.image),
                    onBackgroundImageError: (exception, stackTrace) => exception.toString(),
                  ),
                  title: Text(creator.name, style: TextStyle(color: context.appColors.primary)),
                );
              },
              itemCount: anime.creators.length,
            ),
          ],
        ),
      ),
    );
  }
}
