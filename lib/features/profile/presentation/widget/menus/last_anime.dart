import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/utils/add_base_url.dart';
import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/profile/domain/entities/profile_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileLastAnimeMenu extends StatefulWidget {
  final ProfileEntity profile;
  const ProfileLastAnimeMenu({super.key, required this.profile});

  @override
  State<ProfileLastAnimeMenu> createState() => _ProfileLastAnimeMenuState();
}

class _ProfileLastAnimeMenuState extends State<ProfileLastAnimeMenu> {
  @override
  Widget build(BuildContext context) {
    final anime = AnimeMapper.modelToEntity(
      AnimeModel.fromJson(widget.profile.lastAnime.cast<String, dynamic>()),
    );
    return SizedBox(
      height: 400,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: context.appColors.primaryContainer.withValues(alpha: 0.4),
        child: InkWell(
          onTap: () =>
              context.pushNamed("anime", pathParameters: {"slug": anime.slug}),
          focusColor: context.appColors.primaryContainer.withValues(alpha: 0.1),
          hoverColor: context.appColors.primaryContainer.withValues(alpha: 0.1),
          splashColor: context.appColors.primaryContainer.withValues(
            alpha: 0.1,
          ),
          highlightColor: Colors.transparent,
          child: Row(
            children: [
              Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      addBaseUrl(anime.thumbnail),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 270,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${anime.title.uz} [${anime.age}+]",
                        style: TextStyle(fontSize: 34),
                      ),
                      Text(
                        anime.description.uz,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Chiqarilgan yili: ${anime.publishedYear}"),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        children: (anime.genres)
                            .map(
                              (e) => InkWell(
                                onTap: () {},
                                mouseCursor: SystemMouseCursors.click,
                                child: Text(
                                  e.title.uz,
                                  style: TextStyle(
                                    color: context.appColors.primary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
