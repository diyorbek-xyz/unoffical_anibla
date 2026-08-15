import 'dart:ui';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/base_url.dart';
import 'package:application/features/animes/data/models/page_props.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/controller/anime_controller.dart';
import 'package:application/features/animes/presentation/controller/saved_controller.dart';
import 'package:application/features/animes/presentation/pages/comments_menu.dart';
import 'package:application/features/animes/presentation/pages/creators_menu.dart';
import 'package:application/features/animes/presentation/pages/episodes_menu.dart';
import 'package:application/features/animes/presentation/pages/infos_menu.dart';
import 'package:application/features/comment/data/models/props.dart';
import 'package:application/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:application/features/comment/presentation/bloc/comment_event.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimePage extends StatefulWidget {
  final AnimePageProps props;
  const AnimePage({super.key, required this.props});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  late final SavedController _savedController;
  late final AnimeController _animeController;
  late final EffectCleanup _commentsCleanup;
  bool isSaved = false;

  void toggleSave(String id) {
    _savedController.saveMedia(id, widget.props.animeType);
    setState(() => isSaved = !isSaved);
  }

  @override
  void initState() {
    super.initState();
    _savedController = sl<SavedController>();
    _animeController = sl<AnimeController>()..getFullAnime(widget.props.animeType, widget.props.animeSlug);
    _commentsCleanup = effect(() {
      final anime = _animeController.mediaState.value.value;
      if (anime == null) return;
      context.read<CommentBloc>().add(InitComments(GetCommentsProps(id: anime.id, limit: 20, page: 1, type: widget.props.animeType.toString())));
    });
  }

  @override
  void dispose() {
    _commentsCleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return sliverBodyBuilder();
  }

  Widget sliverBodyBuilder() {
    return DefaultTabController(
      length: widget.props.animeType.isSerie ? 4 : 3,
      child: SignalBuilder(
        builder: (context) {
          final state = _animeController.mediaState.value;
          final data = state.value ?? _animeController.fakeMedia;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () => context.pushNamed("watch", queryParameters: widget.props.toJson()),
              child: Icon(Icons.play_arrow),
            ),
            body: Stack(
              alignment: AlignmentGeometry.center,
              fit: StackFit.expand,
              children: [
                Skeletonizer(
                  enabled: state.isLoading,
                  child: NestedScrollView(
                    clipBehavior: Clip.hardEdge,
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverOverlapAbsorber(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          sliver: appBar(context, data, innerBoxIsScrolled),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: [
                        AnimeInfosMenu(),
                        CommentsMenu(),
                        CreatorsMenu(anime: data),
                        AnimeEpisodesMenu(),
                      ],
                    ),
                  ),
                ),

                if (state.hasError)
                  Skeleton.ignore(
                    ignore: true,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(color: context.appColors.surface.withAlpha(100)),
                        width: 400,
                        height: 400,
                        child: ErrorBuilder(
                          message: state.error ?? "Nimadur xato ketti",
                          refresh: () => _animeController.getMedia(widget.props.animeType, widget.props.animeSlug),
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

  SliverAppBar appBar(BuildContext context, AnimeEntity anime, bool innerBoxIsScrolled) {
    return SliverAppBar.medium(
      leading: Skeleton.keep(
        child: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.keyboard_arrow_left)),
      ),
      automaticallyImplyLeading: true,
      scrolledUnderElevation: 0.0,
      toolbarHeight: kToolbarHeight,
      stretch: true,
      centerTitle: false,
      expandedHeight: 350 + kTextTabBarHeight + kToolbarHeight,
      collapsedHeight: kTextTabBarHeight + kToolbarHeight + MediaQuery.paddingOf(context).top,
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
          if (widget.props.animeType.isSerie) Tab(text: "Episodlar ${anime.totalEpisodes}ta"),
        ],
      ),
      forceElevated: innerBoxIsScrolled,
      flexibleSpace: FlexibleSpaceBar(collapseMode: CollapseMode.pin, background: animeInfo(context, anime)),
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
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.center,
              end: AlignmentGeometry.bottomCenter,
              colors: [Colors.transparent, context.appColors.surface],
            ),
          ),
          padding: EdgeInsetsGeometry.only(top: kToolbarHeight, left: 10, right: 10),
          alignment: AlignmentGeometry.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: .min,
              spacing: 20,
              children: [
                Text("${anime.title.uz} [${anime.age}+]", style: context.textTheme.headlineMedium),
                SizedBox(
                  height: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          constraints: BoxConstraints(maxWidth: 300, minWidth: 100),
                          child: AspectRatio(
                            aspectRatio: 0.65,
                            child: hasBaseUrl(anime.thumbnail)
                                ? CachedNetworkImage(imageUrl: anime.thumbnail, fit: BoxFit.cover)
                                : Skeleton.leaf(enabled: true, child: Container(color: context.appColors.error)),
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
                                infoItem(context: context, label: "Chiqarilgan yili:", value: "${anime.publishedYear}-yil"),
                                infoItem(context: context, label: "Mamlakat:", value: anime.country?['name']?['uz'] ?? "NN"),
                                infoItem(context: context, label: "Studia:", value: anime.studio?['name'] ?? "NN"),
                              ],
                            ),
                            FilledButton.icon(
                              onPressed: () => toggleSave(anime.id),
                              icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
                              label: Text(isSaved ? "O'chirish" : "Saqlash"),
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

  Widget infoItem({required BuildContext context, required String label, String? value, Widget? child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: context.textTheme.titleSmall?.fontSize)),
        (value != null) ? itemValue(context, value) : child!,
      ],
    );
  }

  Widget itemValue(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(fontSize: context.textTheme.titleLarge?.fontSize, fontWeight: FontWeight.bold, color: context.appColors.primary),
    );
  }
}
