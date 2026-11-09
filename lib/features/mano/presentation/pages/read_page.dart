import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:page_flip_view/pdf.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:turnable_page/turnable_page.dart';

class ReadPage extends StatefulWidget {
  final MediaProps props;
  const ReadPage(this.props, {super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final _booksController = sl<BookController>();

  @override
  void initState() {
    super.initState();
    if (widget.props.chapterKey == null) return;
    _booksController.getChapterPages(widget.props.chapterKey!);
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final isMobile = context.isMobile;
      final chaptersState = _booksController.chapters.value;
      final chapterState = _booksController.chapter.value;
      if (chapterState.hasError) return Text(chapterState.error ?? "Xatolik");
      final chapters = chaptersState.value ?? _booksController.fakeChapters;
      final chapter = chapterState.value ?? _booksController.fakeChapter;
      return Scaffold(
        key: _scaffoldKey,
        endDrawer: _drawer(chapters),
        extendBodyBehindAppBar: true,
        extendBody: true,
        persistentFooterDecoration: .new(),
        persistentFooterButtons: !isMobile ? null : _buttons(chapter, context),
        body: Skeletonizer(
          enabled: chapterState.isLoading,
          child: Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Expanded(child: mainView2(context, chapter)),
              _controls(context, chapter),
            ],
          ),
        ),
      );
    },
  );
  Widget mainView2(BuildContext context, ManoChapter chapter) => PageFlipView(
    itemCount: chapter.pages.length,
    itemBuilder: (context, index) => CachedNetworkImage(imageUrl: chapter.pages[index].imageUrl),
  );

  Widget mainView(BuildContext context, ManoChapter chapter) => TurnablePage(
    settings: FlipSettings(
      pageViewMode: context.isMobile ? .single : .double,
      // mobileScrollSupport: true,
      enableZoom: true,
      showCover: true,
      cornerTriggerAreaSize: 50,
      width: .infinity,
      size: .stretch,
    ),
    pagesBoundaryIsEnabled: false,
    pageCount: chapter.pages.length,
    builder: (context, pageIndex, constraints) => Stack(
      alignment: .center,
      fit: .expand,
      clipBehavior: .hardEdge,
      children: [
        CachedNetworkImage(imageUrl: chapter.pages[pageIndex].imageUrl),
        Container(
          alignment: pageIndex % 2 == 0
              ? .bottomEnd
              : context.isMobile
              ? .bottomEnd
              : .bottomStart,
          padding: .all(10),
          child: Badge(
            label: Text("${pageIndex + 1}/${chapter.pages.length}", style: TextStyle(color: context.colors.primaryContainer)),
          ),
        ),
      ],
    ),
  );

  Widget _controls(BuildContext context, ManoChapter chapter) => Ink(
    decoration: BoxDecoration(color: context.colors.primaryContainer, borderRadius: .circular(16)),
    width: 70,
    padding: .all(7),
    child: Column(spacing: 10, crossAxisAlignment: .center, mainAxisAlignment: .center, children: _buttons(chapter, context)),
  );

  List<Widget> _buttons(ManoChapter chapter, BuildContext context) {
    return [
      IconButton.filled(onPressed: context.pop, icon: Icon(Icons.close)),
      IconButton.filled(onPressed: _scaffoldKey.currentState?.openEndDrawer, icon: Icon(Icons.menu)),
      IconButton.filled(
        onPressed: () {},
        icon: Text(chapter.chapterNumber.toString(), style: TextStyle(color: context.colors.onPrimaryFixed)),
      ),
    ];
  }

  Widget _drawer(List<ManoChapter> chapters) => Drawer(
    child: ListView.builder(
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
}
