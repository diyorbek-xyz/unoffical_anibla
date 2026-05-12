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
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/animes/presentation/bloc/season/season_bloc.dart';
import 'package:application/features/animes/presentation/bloc/season/season_event.dart';
import 'package:application/features/animes/presentation/bloc/season/season_state.dart';
import 'package:application/features/animes/presentation/pages/comments_menu.dart';
import 'package:application/features/animes/presentation/pages/creators_menu.dart';
import 'package:application/features/animes/presentation/pages/episodes_menu.dart';
import 'package:application/features/animes/presentation/pages/infos_menu.dart';
import 'package:application/features/comment/data/models/props.dart';
import 'package:application/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:application/features/comment/presentation/bloc/comment_event.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimePage extends StatefulWidget {
  final String slug;
  final String type;
  const AnimePage({super.key, required this.slug, required this.type});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  late PlayerController controller;

  @override
  void initState() {
    context.read<AnimeBloc>().add(
      GetSerie(slug: widget.slug, type: widget.type),
    );
    controller = context.read<PlayerController>();
    super.initState();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AnimeBloc, AnimeState>(
          listenWhen: (previous, current) => current is AnimeSuccess,
          listener: (context, state) {
            final anime = (state as AnimeSuccess).anime;
            final props = GetCommentsProps(
              id: anime.id,
              limit: 10,
              page: 1,
              type: widget.type,
            );
            context.read<CommentBloc>().add(GetComments(props));
            if (widget.type != AnimeType.serie) return;
            context.read<SeasonBloc>().add(GetAllSeasons(state.anime.slug));
          },
        ),
        BlocListener<SeasonBloc, SeasonState>(
          listenWhen: (previous, current) =>
              widget.type == AnimeType.serie && current is SeasonSuccess,
          listener: (context, state) {
            final season = (state as SeasonSuccess).seasons;
            final animeState = context.read<AnimeBloc>().state as AnimeSuccess;
            final animeSlug = animeState.anime.slug;
            context.read<EpisodeBloc>().add(
              GetEpisodes(animeSlug, season.first.slug),
            );
          },
        ),
        BlocListener<EpisodeBloc, EpisodeState>(
          listenWhen: (previous, current) => current is EpisodeSuccess,
          listener: (context, state) {
            if (state is EpisodeSuccess) controller.init(state.episodes);
          },
        ),
      ],
      child: sliverBodyBuilder(),
    );
  }

  Widget sliverBodyBuilder() {
    return DefaultTabController(
      length: widget.type == AnimeType.serie ? 4 : 3,
      child: BlocBuilder<AnimeBloc, AnimeState>(
        builder: (context, state) {
          final isLoading = state is! AnimeSuccess;
          final isError = state is AnimeFilure;
          late AnimeEntity anime;
          if (isLoading) {
            anime = AnimeMapper.modelToEntity(AnimeModel());
          } else {
            anime = state.anime;
          }
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => context.pushNamed(
                "watch",
                pathParameters: {"type": widget.type, "slug": widget.slug},
              ),
              label: Text("Hello"),
              icon: Icon(Icons.play_arrow),
            ),
            body: Stack(
              alignment: AlignmentGeometry.center,
              fit: StackFit.expand,
              children: [
                Skeletonizer(
                  enabled: isLoading,
                  child: NestedScrollView(
                    clipBehavior: Clip.hardEdge,
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context,
                              ),
                          sliver: appBar(context, anime, innerBoxIsScrolled),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: [
                        AnimeInfosMenu(),
                        CommentsMenu(),
                        CreatorsMenu(anime: anime),
                        if (widget.type == AnimeType.serie)
                          AnimeEpisodesMenu(anime: anime),
                      ],
                    ),
                  ),
                ),

                if (isError)
                  Skeleton.ignore(
                    ignore: true,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.appColors.surface.withAlpha(100),
                        ),
                        width: 400,
                        height: 400,
                        child: ErrorBuilder(
                          message: state.message,
                          refresh: () => context.read<AnimeBloc>().add(
                            GetSerie(slug: widget.slug, type: widget.type),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  SliverAppBar appBar(
    BuildContext context,
    AnimeEntity anime,
    bool innerBoxIsScrolled,
  ) {
    return SliverAppBar.medium(
      leading: Skeleton.ignore(
        ignore: true,
        child: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      automaticallyImplyLeading: true,
      scrolledUnderElevation: 0.0,
      toolbarHeight: kToolbarHeight,
      stretch: true,
      centerTitle: false,
      expandedHeight: 350 + kTextTabBarHeight + kToolbarHeight,
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
        tabs: [
          Tab(text: "Ma'lumotlar"),
          Tab(text: "Izohlar"),
          Tab(text: "Ovoz beruvchilar"),
          if (widget.type == AnimeType.serie)
            Tab(text: "Episodlar ${anime.totalEpisodes}ta"),
        ],
      ),
      forceElevated: innerBoxIsScrolled,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: animeInfo(context, anime),
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
                alignment: AlignmentGeometry.xy(0, -0.7),
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
