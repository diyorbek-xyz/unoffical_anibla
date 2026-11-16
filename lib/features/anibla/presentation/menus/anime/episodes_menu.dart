import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/mano/data/models/request/chapter_request.dart';
import 'package:application/features/polished/presentation/controller/media_controller.dart';
import 'package:application/features/polished/view_models/media/chapter_view.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:material_ui/material_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChaptersMenu extends StatefulWidget {
  const ChaptersMenu({super.key});

  @override
  State<ChaptersMenu> createState() => _ChaptersMenuState();
}

class _ChaptersMenuState extends State<ChaptersMenu> {
  late final _mediaController = sl<MediaController>();
  late final _searchController = TextEditingController()..addListener(searchListener);
  ChapterRequest request = ChapterRequest(limit: 30);

  void searchListener() {
    onSearchChange(_searchController.text);
  }

  void onSearchChange(String val) {
    setState(() => request = request.copyWith(search: val));
  }

  void onSearchSubmit(String val) {
    _mediaController.refreshChapters(request);
  }

  void toggleOrder() {
    final OrderDirection order = request.order.isDescending ? .ascending : .descending;
    setState(() => request = request.copyWith(order: order));
  }

  @override
  Widget build(BuildContext context) => SignalBuilder(
    builder: (context) {
      final state = _mediaController.chapters.value;
      if (state.hasError) {
        return ErrorBuilder(message: state.error ?? "Nimadur xato ketti", refresh: _mediaController.refreshChapters);
      }
      final data = state.value;
      return Skeletonizer(
        enabled: state.isLoading,
        enableSwitchAnimation: true,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: CustomScrollView(
              key: const PageStorageKey("episodes"),
              slivers: [
                SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                SliverToBoxAdapter(child: searchBar(state.pagination.total)),
                SliverPadding(
                  padding: .symmetric(vertical: 10),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                      childAspectRatio: 15 / 8,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    addSemanticIndexes: true,
                    addRepaintBoundaries: true,
                    itemCount: data.length,
                    itemBuilder: (_, i) => chapterItem(data[i]),
                  ),
                ),
              ],
            ),
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
        leading: IconButton(padding: EdgeInsets.all(0), onPressed: toggleOrder, icon: Icon(Icons.sort_by_alpha)),
        trailing: [IconButton(onPressed: () => _searchController.clear(), padding: EdgeInsets.all(0), icon: Icon(Icons.clear))],
        hintText: "Qidirish: $total ta qism",
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
