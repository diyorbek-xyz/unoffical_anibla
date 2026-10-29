import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/mano/data/models/data/chapter_page.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/features/mano/presentation/widgets/center_zoom_viewer.dart';
import 'package:application/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReadPage extends StatefulWidget {
  final MediaProps props;
  const ReadPage(this.props, {super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final _booksController = sl<BookController>();
  late final _pageController = PageController();
  bool controlsHidden = false;
  double spacing = 10;

  void _toggleAppBar() => setState(() => controlsHidden = !controlsHidden);

  @override
  void initState() {
    super.initState();
    if (widget.props.chapterKey == null) return;
    _booksController.getChapterPages(widget.props.chapterKey!);
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final chaptersState = _booksController.chapters.value;
      final chapterState = _booksController.chapter.value;
      if (chapterState.hasError) return Text(chapterState.error ?? "Xatolik");
      final chapters = chaptersState.value ?? _booksController.fakeChapters;
      final chapter = chapterState.value ?? _booksController.fakeChapter;
      return Scaffold(
        key: _scaffoldKey,
        endDrawer: drawer(chapters),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Skeletonizer(
          enabled: chapterState.isLoading,
          child: Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _toggleAppBar,
                  child: InteractiveViewer(
                    panAxis: .vertical,
                    panEnabled: true,
                    constrained: true,
                    transformationController: TransformationController(Matrix4.skew(0, 0)),
                    child: _vertical(chapter),
                  ),
                ),
              ),
              _controls(context, chapter),
            ],
          ),
        ),
      );
    },
  );

  Widget _vertical(ManoChapter chapter) => ListView.separated(
    itemCount: chapter.pages.length,
    physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => SizedBox(height: 20),
    itemBuilder: (context, index) => _page(chapter.pages[index]),
  );

  Widget _horizontal(ManoChapter chapter) => PageView.builder(
    physics: BouncingScrollPhysics(),
    scrollDirection: .horizontal,
    controller: _pageController,
    itemCount: chapter.pages.length,
    itemBuilder: (context, index) => _page(chapter.pages[index]),
  );

  Widget _controls(BuildContext context, ManoChapter chapter) => Ink(
    decoration: BoxDecoration(color: context.appColors.primaryContainer, borderRadius: .circular(16)),
    width: 70,
    padding: .all(7),
    child: Column(
      spacing: 10,
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        IconButton.filled(onPressed: _toggleAppBar, icon: Icon(controlsHidden ? Icons.fullscreen_exit : Icons.fullscreen)),
        IconButton.filled(onPressed: _scaffoldKey.currentState?.openEndDrawer, icon: Icon(Icons.menu)),
        IconButton.filled(
          onPressed: () => _pageController.previousPage(duration: Durations.medium4, curve: Curves.easeInOut),
          icon: Icon(Icons.navigate_before),
        ),
        IconButton.filled(
          onPressed: () {},
          icon: Text(chapter.chapterNumber.toString(), style: TextStyle(color: context.appColors.onPrimaryFixed)),
        ),
        IconButton.filled(
          onPressed: () => _pageController.nextPage(duration: Durations.medium4, curve: Curves.easeInOut),
          icon: Icon(Icons.navigate_next),
        ),
      ],
    ),
  );

  Widget drawer(List<ManoChapter> chapters) => Drawer(
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final chapter = chapters[index];
        return ListTile(
          onTap: () => _booksController.getChapterPages(chapter.id),
          title: Text("${chapter.chapterNumber} Bob"),
          leading: Icon(chapter.isFree ? Icons.check : Icons.lock),
        );
      },
    ),
  );

  Widget _page(ChapterPage page) => AspectRatio(
    aspectRatio: page.height / page.width,
    child: CachedNetworkImage(imageUrl: page.imageUrl),
  );
}
