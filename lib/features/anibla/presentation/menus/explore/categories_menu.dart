import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/anibla/data/models/data/category.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:application/features/anibla/presentation/controllers/explore_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CategoriesMenu extends StatelessWidget {
  final SearchController controller;
  final Function(String value, BuildContext context) submit;
  CategoriesMenu({super.key, required this.controller, required this.submit});

  final _exploreController = sl<ExploreController>();

  @override
  Widget build(BuildContext context) => CustomScrollView(
    scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
    key: const PageStorageKey("genres"),
    physics: BouncingScrollPhysics(),
    slivers: [
      CupertinoSliverRefreshControl(onRefresh: _exploreController.refreshAll),
      SignalBuilder(
        builder: (context) {
          final state = _exploreController.categoriesSignal.value;
          if (state.isLoading) {
            return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
          }
          if (state.hasError) {
            final failure = state.error as Failure;
            return SliverFillRemaining(
              child: ErrorBuilder(
                message: ExceptionMapper.mapFailureToMessage(failure),
                refresh: () => _exploreController.refreshAll(),
              ),
            );
          }
          final data = state.value ?? _exploreController.fakeCategories;
          return SliverPadding(
            padding: EdgeInsetsGeometry.all(5),
            sliver: SliverGrid.extent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 5 / 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: data.map((e) => genreItem(context, e)).toList(),
            ),
          );
        },
      ),
    ],
  );

  InkWell genreItem(BuildContext context, Category e) {
    void searchGenre() => submit(controller.text += " c:${e.id}", context);
    return InkWell(
      onTap: searchGenre,
      mouseCursor: SystemMouseCursors.click,
      child: Ink(
        decoration: BoxDecoration(color: context.appColors.primary, borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Text(e.name.uz, style: TextStyle(color: context.appColors.onPrimary, fontSize: 20)),
        ),
      ),
    );
  }
}
