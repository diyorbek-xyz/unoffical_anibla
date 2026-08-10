import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/explore/presentation/controller/explore_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final _exploreController = sl<ExploreController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
      physics: BouncingScrollPhysics(),
      key: const PageStorageKey("results"),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            _exploreController.refreshAll();
            await Future.delayed(Duration(seconds: 1));
          },
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
          sliver: SignalBuilder(
            builder: (context) {
              final state = _exploreController.searchSignal.value;
              if (state.isLoading) {
                return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
              }
              if (state.hasValue) {
                final data = state.value ?? Searched.empty();
                if (data.movies.isEmpty && data.series.isEmpty) {
                  return SliverFillRemaining(child: Center(child: Text("Anime topilmadi")));
                }
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 10,
                    children: [
                      if (data.series.isNotEmpty) gridView(context, "Seriyalar", data.series),
                      if (data.movies.isNotEmpty) gridView(context, "Filmlar", data.movies),
                    ],
                  ),
                );
              }
              return historyBuilder();
            },
          ),
        ),
      ],
    );
  }

  Widget historyBuilder() => SignalBuilder(
    builder: (context) {
      final state = _exploreController.historySignal.value;
      if (state.isLoading) {
        return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
      }
      if (state.hasValue) {
        return SliverToBoxAdapter(child: gridView(context, "Tarix", state.value ?? [], true));
      }
      return SliverFillRemaining(child: Center(child: Text("Animelarni qidiring")));
    },
  );

  Widget gridView(BuildContext context, String title, List<AnimeEntity> animes, [bool? isFromHistory]) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: animes.isNotEmpty ? .start : .center,
      spacing: 7,
      children: [
        Text(title, style: width < MOBILE_WIDTH ? context.textTheme.headlineSmall : context.textTheme.headlineLarge),
        GridView.builder(
          shrinkWrap: true,
          itemCount: animes.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 9 / 15,
          ),
          itemBuilder: (context, index) {
            if (isFromHistory == null || !isFromHistory) return AnimeCard(expand: true, anime: animes.elementAt(index));
            return Stack(
              alignment: AlignmentGeometry.topLeft,
              children: [
                AnimeCard(expand: true, aspectRatio: 9 / 15, anime: animes.elementAt(index)),
                Positioned(
                  top: 4,
                  left: 4,
                  child: IconButton(
                    mouseCursor: SystemMouseCursors.click,
                    color: context.appColors.errorContainer,
                    onPressed: () => _exploreController.deleteFromHistory(animes.elementAt(index).id),
                    icon: Icon(Icons.delete),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
