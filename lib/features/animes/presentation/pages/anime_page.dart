import 'dart:ui';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_event.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_event.dart';
import 'package:application/features/animes/presentation/bloc/season/season_bloc.dart';
import 'package:application/features/animes/presentation/bloc/season/season_event.dart';
import 'package:application/features/animes/presentation/bloc/season/season_state.dart';
import 'package:application/features/animes/presentation/pages/comments_menu.dart';
import 'package:application/features/animes/presentation/pages/episodes_menu.dart';
import 'package:application/features/animes/presentation/pages/infos_menu.dart';
import 'package:application/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:application/injection_container.dart';
import 'package:application/network/errors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimePage extends StatelessWidget {
  final String slug;
  const AnimePage({super.key, required this.slug});

  static List tabs = ["Ma'lumot", "Izohlar", "Episodlar"];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AnimeBloc>()..add(GetSerie(slug))),
        BlocProvider(create: (context) => sl<SeasonBloc>()),
        BlocProvider(create: (context) => sl<EpisodeBloc>()),
        BlocProvider(create: (context) => sl<CommentBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AnimeBloc, AnimeState>(
            listener: (context, state) {
              if (state is AnimeSuccess) {
                context.read<SeasonBloc>().add(GetAllSeasons(state.anime.slug));
              }
            },
          ),
          BlocListener<SeasonBloc, SeasonState>(
            listener: (context, state) {
              if (state is SeasonSuccess) {
                print("Success");
                final animeSlug =
                    (context.read<AnimeBloc>().state as AnimeSuccess)
                        .anime
                        .slug;
                context.read<EpisodeBloc>().add(
                  GetEpisodes(animeSlug, state.seasons.first.slug),
                );
              }
            },
          ),
        ],
        child: sliverBodyBuilder(),
      ),
    );
  }

  Widget sliverBodyBuilder() {
    return PopScope(
      canPop: true,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: BlocBuilder<AnimeBloc, AnimeState>(
            builder: (context, state) {
              if (state is AnimeFilure) {
                if (state.message == ErrorMessages.unauthorized) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message),
                        ElevatedButton(
                          onPressed: () => context.pushNamed("login"),
                          child: Text("Kirish"),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: Text(state.message));
              }
              if (state is AnimeSuccess || state is AnimeLoading) {
                final isLoading = state is AnimeLoading;
                late AnimeEntity anime;
                if (state is AnimeSuccess) {
                  anime = state.anime;
                } else {
                  anime = AnimeMapper.modelToEntity(AnimeModel());
                }
                return Skeletonizer(
                  enabled: isLoading,
                  child: NestedScrollView(
                    clipBehavior: Clip.hardEdge,
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar.medium(
                          automaticallyImplyLeading: true,
                          scrolledUnderElevation: 0.0,
                          toolbarHeight: kToolbarHeight,
                          stretch: true,
                          centerTitle: false,
                          expandedHeight:
                              350 + kTextTabBarHeight + kToolbarHeight,
                          collapsedHeight:
                              kTextTabBarHeight +
                              kToolbarHeight +
                              MediaQuery.paddingOf(context).top,
                          title: Text(anime.title.uz),
                          bottom: TabBar(
                            tabAlignment: TabAlignment.center,
                            isScrollable: true,
                            dividerHeight: 0,
                            indicatorWeight: 3,
                            tabs: tabs.map((e) => Tab(text: e)).toList(),
                          ),
                          forceElevated: innerBoxIsScrolled,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            background: animeInfo(context, anime),
                          ),
                        ),
                      ];
                    },
                    body: SizedBox(
                      child: TabBarView(
                        children: [
                          AnimeInfosMenu(),
                          CommentsMenu(),
                          AnimeEpisodesMenu(anime: anime),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Text("");
            },
          ),
        ),
      ),
    );
  }

  Widget animeInfo(BuildContext context, AnimeEntity anime) {
    return DecoratedBox(
      decoration: hasBaseUrl(anime.cover)
          ? BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(anime.cover),
                opacity: 0.6,
                fit: BoxFit.cover,
              ),
            )
          : BoxDecoration(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.center,
              end: AlignmentGeometry.bottomCenter,
              colors: [Colors.transparent, context.appColors.surface],
            ),
          ),
          padding: EdgeInsetsGeometry.only(
            top: kToolbarHeight,
            left: 10,
            right: 10,
          ),
          alignment: AlignmentGeometry.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: .min,
              spacing: 20,
              children: [
                Text(
                  "${anime.title.uz} [${anime.age}+]",
                  style: context.textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          constraints: BoxConstraints(
                            maxWidth: 300,
                            minWidth: 100,
                          ),
                          child: AspectRatio(
                            aspectRatio: 0.65,
                            child: hasBaseUrl(anime.thumbnail)
                                ? CachedNetworkImage(
                                    imageUrl: anime.thumbnail,
                                    fit: BoxFit.cover,
                                  )
                                : Skeleton.leaf(
                                    enabled: true,
                                    child: Container(
                                      color: context.appColors.error,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 5,
                              crossAxisAlignment: .start,
                              children: [
                                infoItem(
                                  context: context,
                                  label: "Chiqarilgan yili:",
                                  value: "${anime.publishedYear}-yil",
                                ),
                                infoItem(
                                  context: context,
                                  label: "Mamlakat:",
                                  value: anime.country?['name']?['uz'] ?? "NN",
                                ),
                                infoItem(
                                  context: context,
                                  label: "Studia:",
                                  value: anime.studio?['name'] ?? "NN",
                                ),
                              ],
                            ),
                            FilledButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark_outline),
                              label: Text("Saqlash"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoItem({
    required BuildContext context,
    required String label,
    String? value,
    Widget? child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: context.textTheme.titleSmall?.fontSize),
        ),
        (value != null) ? itemValue(context, value) : child!,
      ],
    );
  }

  Widget itemValue(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.textTheme.titleLarge?.fontSize,
        fontWeight: FontWeight.bold,
        color: context.appColors.primary,
      ),
    );
  }
}
