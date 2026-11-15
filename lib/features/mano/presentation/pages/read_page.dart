import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/mano/data/models/data/mano_chapter.dart';
import 'package:application/features/mano/presentation/controllers/book_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_space/flutter_space.dart';
import 'package:go_router/go_router.dart';
import 'package:m3e_slider/m3e_slider.dart';
import 'package:material_ui/material_ui.dart';
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
  late double width = context.screen.width - (context.isMobile ? 0 : 70);

  void resize(double size) {
    setState(() => width = size.clamp(100, context.screen.width - (context.isMobile ? 0 : 70)));
  }

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
      if (chaptersState.hasError || chapterState.hasError) return Text(chapterState.error ?? chaptersState.error ?? "Xatolik");
      if (chaptersState.isLoading || chapterState.isLoading)
        return Center(child: SizedBox.square(dimension: 100, child: CircularProgressIndicator(year2023: false)));

      final chapters = chaptersState.value ?? _booksController.fakeChapters;
      final chapter = chapterState.value ?? _booksController.fakeChapter;
      return Scaffold(
        key: _scaffoldKey,
        endDrawer: _drawer(chapters),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Skeletonizer(
          enabled: chapterState.isLoading,
          child: PlatformBuilder(
            desktopBuilder: (context, isMobile) => Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Expanded(child: pagesView(chapter)),
                Padding(
                  padding: .all(10),
                  child: Container(
                    decoration: BoxDecoration(color: context.colors.primaryContainer, borderRadius: .circular(100)),
                    width: 60,
                    padding: .all(7),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      children: _buttons(chapter),
                    ),
                  ),
                ),
              ],
            ),
            mobileBuilder: (context, isMobile) => Stack(
              fit: .passthrough,
              children: [
                pagesView(chapter),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(color: context.colors.primaryContainer, borderRadius: .circular(100)),
                    width: 60,
                    padding: .all(7),
                    child: Row(spacing: 10, crossAxisAlignment: .center, mainAxisAlignment: .center, children: _buttons(chapter)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  Widget pagesView(ManoChapter chapter) => ListView.builder(
    itemCount: chapter.pages.length,
    addRepaintBoundaries: true,
    itemBuilder: (context, index) {
      final page = chapter.pages[index];
      final aspect = page.width / page.height;
      return Center(
        child: CachedNetworkImage(
          width: width,
          height: width / aspect,
          imageUrl: page.imageUrl,
          fit: .contain,
          alignment: .center,
        ),
      );
    },
  );

  List<Widget> _buttons(ManoChapter chapter) => [
    IconButton.filled(onPressed: context.pop, icon: Icon(Icons.close)),
    Spacer(flex: 5),
    IconButton.filled(
      onPressed: () {},
      icon: Text(chapter.chapterNumber.toString(), style: TextStyle(color: context.colors.onPrimaryFixed)),
    ),
    IconButton.filled(onPressed: _scaffoldKey.currentState?.openEndDrawer, icon: Icon(Icons.menu)),
    IconButton.filled(
      onPressed: () => _scaffoldKey.currentState?.showBottomSheet(
        _bottomSheet,
        enableDrag: true,
        showDragHandle: true,
        constraints: BoxConstraints.tightFor(height: context.screen.height / 1.6, width: 720),
      ),
      icon: Icon(Icons.settings),
    ),
    Space(10),
    IconButton.filled(onPressed: () => resize(width + 30), icon: Icon(Icons.zoom_in)),
    IconButton.filled(onPressed: () => resize(width - 30), icon: Icon(Icons.zoom_out)),
  ];

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

  Widget _bottomSheet(BuildContext context) {
    final dec = M3ESliderDecoration(trackHeight: 30, trackCornerRadius: 8);
    return Padding(
      padding: const .symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 5,
        children: [
          Text("Kontrast", style: context.textTheme.titleMedium),
          M3ESlider(value: 0.2, decoration: dec, min: -50, max: 50, onChanged: (value) {}),
          Text("Yorqinlik", style: context.textTheme.titleMedium),
          M3ESlider(value: 0.6, decoration: dec, min: 0, max: 100, onChanged: (value) {}),
          Text("Ajratish", style: context.textTheme.titleMedium),
          M3ESlider(value: 0.9, decoration: dec, min: 0, max: 100, onChanged: (value) {}),
        ],
      ),
    );
  }
}
