import 'dart:ui';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/network/resources/errors.dart';
import 'package:application/features/anibla/data/enums/media_type.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/presentation/controllers/comment_controller.dart';
import 'package:application/features/anibla/data/models/mano/manga.dart';
import 'package:application/shared/utils/base_url.dart';
import 'package:application/features/anibla/data/models/main/anime.dart';
import 'package:application/features/anibla/presentation/controllers/media_controller.dart';
import 'package:application/features/anibla/presentation/controllers/saved_controller.dart';
import 'package:application/features/anibla/presentation/menus/anime/comments_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/creators_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/episodes_menu.dart';
import 'package:application/features/anibla/presentation/menus/anime/infos_menu.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/shared/widgets/image.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MediaPage extends StatefulWidget {
  final MediaProps props;
  const MediaPage(this.props, {super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  late final LocalAnimesController? _savedController;
  late final MediaController _mediaController;
  late final CommentController _commentController;
  late final EffectCleanup _errorDialogCleanup;
  EffectCleanup? _commentsCleanup;
  bool isSaved = false;

  void toggleSave(String id) {
    _savedController?.saveMedia(id, widget.props.type);
    setState(() => isSaved = !isSaved);
  }

  @override
  void initState() {
    super.initState();
    _mediaController = sl<MediaController>();
    _commentController = sl<CommentController>();
    _mediaController.getMedia(widget.props.type, widget.props.mediaKey);
    _errorDialogCleanup = effect(() {
      if (_mediaController.animeState.hasError) {
        openErrorDialog(
          context,
          refresh: _mediaController.refreshFullAnime,
          error: _mediaController.animeState.error ?? "Nimadur xato ketti",
        );
      }
    });
    if (widget.props.type.isBook) return;
    _savedController = sl<LocalAnimesController>();
    _commentsCleanup = _mediaController.animeState.subscribe((value) {
      if (value.hasValue) _commentController.getAnimeComments(20);
    });
  }

  @override
  void dispose() {
    _mediaController.resetMedia();
    _commentController.resetAll();
    _commentsCleanup?.call();
    _errorDialogCleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.props.type.isSerie ? 4 : 3,
      child: SignalBuilder(
        builder: (context) {
          final type = widget.props.type;
          final state = type.isAnime ? _mediaController.animeState.value : _mediaController.mangaState.value;
          final fake = type.isAnime ? _mediaController.fakeAnime : _mediaController.fakeManga;
          final data = state.value ?? fake;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () => context.pushNamed("watch", queryParameters: widget.props.toJson()),
              child: Icon(Icons.play_arrow),
            ),
            body: Skeletonizer(
              enabled: state.isLoading,
              child: NestedScrollView(
                clipBehavior: Clip.hardEdge,
                headerSliverBuilder: (c, i) => heroBuilder(c, i, type, data),
                body: TabBarView(
                  children: [
                    AnimeInfosMenu(),
                    CommentsMenu(),
                    CreatorsMenu(anime: type.isAnime ? data as Anime : Anime()),
                    if (type.isSerie) AnimeEpisodesMenu(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> heroBuilder(BuildContext context, bool innerBoxIsScrolled, MediaType type, Object data) {
    final anime = type.isAnime ? data as Anime : null;
    final manga = type.isBook ? data as Manga : null;
    final title = type.isAnime ? "${anime?.title.uz} [${anime?.age}+]" : "${manga?.title} [${manga?.ageRestriction}]";
    final thumbnail = type.isAnime ? anime?.thumbnail : manga?.thumbnail;
    final animeInfo = [
      infoItem(context: context, label: "Chiqarilgan yili:", value: "${anime?.publishedYear}-yil"),
      infoItem(context: context, label: "Mamlakat:", value: anime?.country?['name']?['uz'] ?? "NN"),
      infoItem(context: context, label: "Studia:", value: anime?.studio?['name'] ?? "NN"),
    ];
    final mangaInfo = [
      infoItem(context: context, label: "Chiqarilgan yili:", value: "${manga?.releaseYear}-yil"),
      infoItem(context: context, label: "Holati:", value: manga?.releaseStatus.name ?? ""),
      infoItem(context: context, label: "Ko'rishlar:", value: "${manga?.viewsCount} ta"),
    ];
    final infoItems = type.isAnime ? animeInfo : mangaInfo;
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: appBar(
          context: context,
          innerBoxIsScrolled: innerBoxIsScrolled,
          thumbnail: thumbnail ?? "",
          title: title,
          infoItems: infoItems,
        ),
      ),
    ];
  }

  SliverAppBar appBar({
    required BuildContext context,
    required bool innerBoxIsScrolled,
    required String thumbnail,
    required String title,
    required List<Widget> infoItems,
  }) => SliverAppBar.medium(
    leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.keyboard_arrow_left)),
    automaticallyImplyLeading: true,
    scrolledUnderElevation: 0.0,
    toolbarHeight: kToolbarHeight,
    stretch: true,
    centerTitle: false,
    expandedHeight: 350 + kTextTabBarHeight + kToolbarHeight,
    collapsedHeight: kTextTabBarHeight + kToolbarHeight + MediaQuery.paddingOf(context).top,
    title: Text(title),
    bottom: TabBar(
      tabAlignment: TabAlignment.center,
      isScrollable: true,
      dividerHeight: 0,
      indicatorWeight: 3,
      tabs: [
        Tab(text: "Ma'lumotlar"),
        Tab(text: "Izohlar"),
        Tab(text: "Ovoz beruvchilar"),
        if (widget.props.type.isSerie) Tab(text: "Episodlar"),
      ],
    ),
    forceElevated: innerBoxIsScrolled,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProviderFallback(thumbnail),
            opacity: 0.6,
            alignment: AlignmentGeometry.xy(0, -0.7),
            fit: BoxFit.cover,
          ),
        ),
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
                  Text(title, style: context.textTheme.headlineMedium),
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
                              child: isUsable(thumbnail)
                                  ? SafeImage(imageUrl: thumbnail, fit: BoxFit.cover)
                                  : Skeleton.leaf(enabled: true, child: Container(color: context.appColors.error)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(spacing: 5, crossAxisAlignment: .start, children: infoItems),
                              FilledButton.icon(
                                onPressed: () {},
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
      ),
    ),
  );

  Widget infoItem({required BuildContext context, required String label, String? value, Widget? child}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: context.textTheme.titleSmall?.fontSize)),
      (value != null) ? itemValue(context, value) : child!,
    ],
  );

  Widget itemValue(BuildContext context, String text) => Text(
    text,
    style: TextStyle(
      fontSize: context.textTheme.titleLarge?.fontSize,
      fontWeight: FontWeight.bold,
      color: context.appColors.primary,
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
