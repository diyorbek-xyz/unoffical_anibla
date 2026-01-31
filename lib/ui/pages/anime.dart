import 'package:application/constants/colors.dart';
import 'package:application/constants/icons.dart';
import 'package:application/data/repositories/animes_repo.dart';
import 'package:application/miscs/utils.dart';
import 'package:application/provider/anime.dart';
import 'package:application/data/models/anime.dart';
import 'package:application/ui/widgets/ui/badge.dart';
import 'package:application/ui/widgets/ui/recommends.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AnimePage extends StatefulWidget {
  final String id;
  const AnimePage({super.key, required this.id});
  @override
  State<StatefulWidget> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  final _repo = AnimesRepository();

  Anime? _anime;
  bool _loading = true;
  String? _error;
  bool _collapsed = false;

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final anime = await _repo.getById(widget.id);
      if (!mounted) return;
      setState(() {
        _anime = anime;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimeProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () => _load(),
          child: Builder(
            builder: (context) {
              if (_loading) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              if (_error != null) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(_error!),
                      ElevatedButton.icon(onPressed: () => _load(), icon: Icon(Icons.replay_outlined), label: Text("Yanglilash")),
                    ],
                  ),
                );
              }
              final anime = _anime!;
              final index = context.watch<AnimeProvider>().episode;
              final width = MediaQuery.of(context).size.width;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: responsive([
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 10,
                        children: [
                          video(),
                          SelectableText(
                            "${anime.series.isNotEmpty ? anime.series[index].title.uz : ""} ${anime.title.uz}",
                            style: TextStyle(fontSize: 23),
                          ),
                          infos(context),
                          description(),
                          comments(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          spacing: 15,
                          crossAxisAlignment: .start,
                          children: [
                            if (!anime.isMovie && width > 1000) episodes(context),
                            ...anime.categories.map((category) => WidgetRecommends(id: category.id)),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget responsive(List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return Column(mainAxisSize: MainAxisSize.min, children: children.map((c) => c is Expanded ? c.child : c).toList());
        } else {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, spacing: 10, children: children);
        }
      },
    );
  }

  Widget infos(BuildContext context) {
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
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(_anime!.studio, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                Text(_anime!.director),
              ],
            ),
          ],
        ),
        controls(context),
      ],
    );
  }

  Widget video() {
    return Center(
      child: Container(
        height: 450,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: _anime!.thumbnail, fit: BoxFit.cover),
            imageUrl: _anime!.poster,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) {
              return Center(child: CircularProgressIndicator.adaptive(value: progress.progress));
            },
          ),
        ),
      ),
    );
  }

  Widget controls(BuildContext context) {
    openModal() => showBottomSheet(
      context: context,
      constraints: BoxConstraints(minWidth: 300, maxWidth: 1000, minHeight: 400, maxHeight: 700),
      enableDrag: true,
      builder: (dialogContext) {
        return Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Barcha qismlar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () => Navigator.pop(dialogContext), icon: Icon(Icons.close)),
                ],
              ),
              Expanded(
                child: GridView.extent(
                  maxCrossAxisExtent: 170,
                  childAspectRatio: 5 / 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: _anime!.series.asMap().entries.map((entry) {
                    return FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          entry.key == dialogContext.watch<AnimeProvider>().episode ? primary : primaryTint,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        surfaceTintColor: WidgetStatePropertyAll(primaryTint),
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                        overlayColor: WidgetStatePropertyAll(primaryTint),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
                      onPressed: () => dialogContext.read<AnimeProvider>().changeEpisode(value: entry.key),
                      child: Text(entry.value.title.uz, style: TextStyle(fontSize: 17)),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );

    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          if (width < 1000)
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
            icon: Icon(MyIcons.like),
          ),
          IconButton(
            color: primaryDark,
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(primaryTint)),
            onPressed: () {},
            icon: Icon(MyIcons.dislike),
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
      ),
    );
  }

  Widget description() {
    final anime = _anime!;
    return InkWell(
      onTap: () => setState(() => _collapsed = !_collapsed),
      hoverColor: primaryTint,
      splashColor: primaryTint,
      highlightColor: primaryTint,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                WidgetBadge(text: "${compact.format(anime.views)} ko'rishlar"),
                WidgetBadge(text: "${DateTime.now().year - anime.year} years ago"),
                ...anime.categories.map((category) => WidgetBadge(text: category.title.uz)),
              ],
            ),
            Text(anime.description.uz, overflow: TextOverflow.ellipsis, maxLines: _collapsed ? 3 : 999),
          ],
        ),
      ),
    );
  }

  Widget comments() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(
          height: 100,
          child: Row(
            spacing: 10,
            crossAxisAlignment: .start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: Image.asset('assets/images/avatar.png', height: 60),
              ),
              Expanded(child: TextField(maxLength: 100, minLines: 1, maxLines: 3)),
              IconButton(onPressed: () {}, icon: Icon(Icons.message)),
            ],
          ),
        ),
        Builder(
          builder: (context) {
            return Column(spacing: 10, children: _anime!.comments.map((e) => comment(e)).toList());
          },
        ),
      ],
    );
  }

  Widget comment(Comment comment) {
    final compact = NumberFormat.compact(locale: "uz");
    final ButtonStyle buttonStyle = ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 7, vertical: -3)));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        CircleAvatar(minRadius: 20, maxRadius: 30, backgroundImage: CachedNetworkImageProvider(comment.user.avatar)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(comment.user.name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text(comment.message),
              Row(
                spacing: 5,
                children: [
                  TextButton.icon(
                    style: buttonStyle,
                    onPressed: () {},
                    icon: Icon(MyIcons.like),
                    label: Text(compact.format(comment.likes)),
                  ),
                  TextButton.icon(style: buttonStyle, onPressed: () {}, label: Icon(MyIcons.dislike)),
                  TextButton.icon(style: buttonStyle, onPressed: () {}, label: Icon(Icons.reply)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget episodes(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Barcha qismlar", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 30, maxHeight: 230),
          child: Material(
            clipBehavior: Clip.hardEdge,
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                children: [
                  ..._anime!.series.asMap().entries.map((e) {
                    return ListTile(
                      selected: e.key == context.watch<AnimeProvider>().episode,
                      selectedTileColor: primary,
                      selectedColor: Colors.white,
                      onTap: () => context.read<AnimeProvider>().changeEpisode(value: e.key),
                      title: Text(e.value.title.uz),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
