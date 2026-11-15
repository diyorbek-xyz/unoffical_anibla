import 'dart:async';

import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/polished/presentation/controller/media_controller.dart';
import 'package:application/features/polished/view_models/media/chapter_view.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ChaptersMenu extends StatefulWidget {
  const ChaptersMenu({super.key});

  @override
  State<ChaptersMenu> createState() => _ChaptersMenuState();
}

class _ChaptersMenuState extends State<ChaptersMenu> {
  late final _mediaController = sl<MediaController>();
  final _searchController = TextEditingController();
  bool _isReversedEpisodeList = false;
  Timer? _debounce;
  String? _search;

  void onSearchChange(String val) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () => onSearchSubmit(val));
  }

  void onSearchSubmit(String val) {
    _debounce?.cancel();
    setState(() => _search = val);
  }

  bool checkIsContains(String title) {
    if (_search == null) return true;
    final hasRusian = title.toLowerCase().contains(_search!.toLowerCase());
    final hasUzbek = title.toLowerCase().contains(_search!.toLowerCase());
    return hasUzbek || hasRusian;
  }

  List<ChapterView> changeList(List<ChapterView> list) {
    final searched = list.where((e) => checkIsContains(e.title)).toList();
    if (_isReversedEpisodeList) return searched.reversed.toList();
    return searched;
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final state = _mediaController.chapters.value;
      print("HasError: ${state.hasError}");
      print("Error: ${state.error}");
      if (state.hasError) return ErrorBuilder(message: state.error ?? "Nimadur xato ketti", refresh: () {});
      if (state.isLoading) return Center(child: CircularProgressIndicator());
      final data = state.value;
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: CustomScrollView(
            key: const PageStorageKey("episodes"),
            slivers: [
              SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverToBoxAdapter(child: searchBar(state.pagination.total)),
              SliverPadding(
                padding: .symmetric(vertical: 10),
                sliver: SliverGrid.extent(
                  maxCrossAxisExtent: 160,
                  childAspectRatio: 15 / 8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: changeList(data).map(chapterItem).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget searchBar(int total) => Center(
    child: ConstrainedBox(
      constraints: .tightFor(width: 600),
      child: SearchBar(
        backgroundColor: .all(context.colors.primaryContainer.withAlpha(120)),
        controller: _searchController,
        leading: IconButton(
          padding: EdgeInsets.all(0),
          onPressed: () => setState(() => _isReversedEpisodeList = !_isReversedEpisodeList),
          icon: Icon(Icons.sort_by_alpha),
        ),
        trailing: [IconButton(onPressed: () => _searchController.clear(), padding: EdgeInsets.all(0), icon: Icon(Icons.clear))],
        hintText: "Qidirish: $total ta qism",
        onChanged: onSearchSubmit,
        onSubmitted: onSearchSubmit,
      ),
    ),
  );

  Widget chapterItem(ChapterView value) {
    final typeColor = value.isFree ? context.colors.secondary : context.colors.primary;
    final currentColor = typeColor.withAlpha(50);
    return RepaintBoundary(
      child: Tooltip(
        waitDuration: Duration(seconds: 1),
        decoration: BoxDecoration(color: context.colors.primaryContainer),
        ignorePointer: true,
        preferBelow: true,
        textStyle: TextStyle(color: context.colors.onPrimaryContainer),
        message: "${value.offset}-qism: ${value.title}",
        child: InkWell(
          onTap: () => _mediaController.openMedia(context, chapterKey: value.key),
          borderRadius: BorderRadius.circular(10),
          mouseCursor: SystemMouseCursors.click,
          child: Stack(
            clipBehavior: .antiAlias,
            children: [
              if (value.progress > 0.0)
                Flexible(
                  fit: .tight,
                  child: LayoutBuilder(
                    builder: (_, consts) => Align(
                      alignment: .centerStart,
                      child: Container(width: (consts.maxWidth * value.progress), color: currentColor.withAlpha(20)),
                    ),
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: currentColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: .symmetric(horizontal: 10),
                alignment: AlignmentGeometry.center,
                child: Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,
                  spacing: 5,
                  children: [
                    Text(
                      "${value.offset}-qism",
                      style: context.textTheme.titleMedium!.copyWith(color: context.colors.onPrimaryContainer),
                    ),
                    Text(value.title, maxLines: 1, overflow: .ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
