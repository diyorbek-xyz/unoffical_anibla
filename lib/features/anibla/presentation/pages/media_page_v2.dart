import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/view_model/media_view.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class MediaPageV2 extends StatefulWidget {
  final MediaProps mediaProps;
  final MediaView mediaInfos;
  const MediaPageV2({super.key, required this.mediaInfos, required this.mediaProps});

  @override
  State<MediaPageV2> createState() => _MediaPageV2State();
}

class _MediaPageV2State extends State<MediaPageV2> {
  TextStyle get _bodyTitleStyle => context.textTheme.titleLarge!;
  TextStyle get _bodyValueStyle => context.textTheme.bodyLarge!;
  TextStyle get _baseTitleStyle => context.textTheme.titleMedium!.copyWith(color: context.colors.primary);
  TextStyle get _baseValueStyle => context.textTheme.titleLarge!.copyWith(overflow: .clip);

  @override
  Widget build(BuildContext context) => Scaffold(
    extendBody: true,
    persistentFooterDecoration: .new(),
    persistentFooterAlignment: .bottomCenter,
    persistentFooterButtons: [
      FloatingActionButton.small(heroTag: "save", onPressed: () {}, child: Icon(Icons.bookmark_outline)),
      FloatingActionButton(onPressed: () {}, child: Icon(Icons.play_arrow)),
      FloatingActionButton.small(heroTag: "share", onPressed: () {}, child: Icon(Icons.share_outlined)),
    ],
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: imageProviderFallback(widget.mediaInfos.cover), fit: .cover, alignment: .center),
      ),
      child: SingleChildScrollView(
        scrollDirection: .vertical,
        padding: .only(top: context.screen.height / 2.4).add(.symmetric(horizontal: context.isMobile ? 0 : 10)),
        primary: true,
        clipBehavior: .none,
        child: Center(
          child: ConstrainedBox(
            constraints: .tightFor(width: 1080),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: .only(topLeft: .circular(30), topRight: .circular(30)),
              ),
              child: Padding(
                padding: .all(context.isMobile ? 20 : 30),
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: .start,
                  children: [_titleBar, _baseInfos, _descriptions, _frames, _translators],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget get _translators => Column(
    crossAxisAlignment: .start,
    spacing: 7,
    children: [
      Text("Ovoz berdi", style: _bodyTitleStyle),
      Text(widget.mediaInfos.translators.entries.map((e) => e.value).join(', '), style: _bodyValueStyle),
    ],
  );

  Widget get _frames => Column(
    crossAxisAlignment: .start,
    spacing: 7,
    children: [
      Text("Kardlar", style: _bodyTitleStyle),
      SizedBox(
        height: context.isMobile ? 300 : 400,
        child: CarouselView.weighted(
          itemSnapping: true,
          consumeMaxWeight: true,
          flexWeights: context.isMobile ? [1] : [1, 5, 1],
          children: widget.mediaInfos.frames.map((e) => Ink.image(fit: .cover, image: CachedNetworkImageProvider(e))).toList(),
        ),
      ),
    ],
  );

  Widget get _descriptions => Column(
    crossAxisAlignment: .start,
    spacing: 7,
    children: [
      Text("Malumotlar", style: _bodyTitleStyle),
      Text(widget.mediaInfos.description, style: _bodyValueStyle),
    ],
  );

  Widget get _titleBar => Text.rich(
    TextSpan(
      children: [
        WidgetSpan(
          alignment: .middle,
          child: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.navigate_before)),
        ),
        TextSpan(text: " ${widget.mediaInfos.title}"),
      ],
    ),
    textAlign: .start,
    style: context.textTheme.displaySmall,
  );

  Widget get _baseInfos => SizedBox(
    height: context.isMobile ? 250 : 300,
    child: Row(
      spacing: context.isMobile ? 10 : 20,
      crossAxisAlignment: .start,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: .circular(20)),
          clipBehavior: .antiAlias,
          child: AspectRatio(
            aspectRatio: 9 / 13,
            child: CachedNetworkImage(fit: .cover, imageUrl: widget.mediaInfos.thumbnail, filterQuality: .medium),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: .max,
            crossAxisAlignment: .start,
            children: [
              Text("Studio", style: _baseTitleStyle),
              Text(widget.mediaInfos.studio, style: _baseValueStyle, maxLines: 1),
              Text("Rejissior", style: _baseTitleStyle),
              Text(widget.mediaInfos.author, style: _baseValueStyle, maxLines: 1),
              Text("Janr", style: _baseTitleStyle),
              Text(widget.mediaInfos.genres.entries.map((e) => e.value).join(", "), style: _baseValueStyle, maxLines: 1),
              Text("Kategoriya", style: _baseTitleStyle),
              Text(widget.mediaInfos.categories.entries.map((e) => e.value).join(", "), style: _baseValueStyle, maxLines: 1),
            ],
          ),
        ),
      ],
    ),
  );
}
