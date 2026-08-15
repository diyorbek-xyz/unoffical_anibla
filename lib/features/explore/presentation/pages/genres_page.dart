import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:application/features/explore/presentation/controller/explore_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/network/resources/failure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class GenresPage extends StatelessWidget {
  final SearchController controller;
  final Function(String value, BuildContext context) submit;
  GenresPage({super.key, required this.controller, required this.submit});

  final _exploreController = sl<ExploreController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
      key: const PageStorageKey("genres"),
      physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(onRefresh: _exploreController.refreshAll),
        SignalBuilder(
          builder: (context) {
            final state = _exploreController.genresSignal.value;
            if (state.isLoading) {
              return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
            }
            if (state.hasError) {
              final failure = state.error as Failure;
              return SliverFillRemaining(
                child: ErrorBuilder(message: ExceptionMapper.mapFailureToMessage(failure), refresh: () => _exploreController.refreshAll()),
              );
            }
            final data = state.value ?? _exploreController.fakeGenres;
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
  }

  InkWell genreItem(BuildContext context, GenreEntity e) {
    void searchGenre() {
      submit(controller.text += " g:${e.id}", context);
    }

    return InkWell(
      onTap: searchGenre,
      mouseCursor: SystemMouseCursors.click,
      child: Ink(
        decoration: BoxDecoration(color: context.appColors.primary, borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Text(e.title.uz, style: TextStyle(color: context.appColors.onPrimary, fontSize: 20)),
        ),
      ),
    );
  }
}
