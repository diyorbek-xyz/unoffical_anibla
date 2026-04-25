import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/explore/presentation/bloc/history/history_bloc.dart';
import 'package:application/features/explore/presentation/bloc/history/history_event.dart';
import 'package:application/features/explore/presentation/bloc/history/history_state.dart';
import 'package:application/features/explore/presentation/bloc/search/search_bloc.dart';
import 'package:application/features/explore/presentation/bloc/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HistoryBloc>().add(GetHistory());
        await Future.delayed(Duration(seconds: 2));
      },
      displacement: 130,
      child: CustomScrollView(
        scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
        key: const PageStorageKey("results"),
        slivers: [
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            sliver: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                switch (state) {
                  case SearchLoading():
                    return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
                  case SearchFound():
                    if (state.movies.isEmpty && state.series.isEmpty) {
                      return SliverFillRemaining(child: Center(child: Text("Anime topilmadi")));
                    }
                    return SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: .start,
                        spacing: 10,
                        children: [
                          if (state.series.isNotEmpty) gridView(context, "Seriyalar", state.series),
                          if (state.movies.isNotEmpty) gridView(context, "Filmlar", state.movies),
                        ],
                      ),
                    );
                  default:
                    return hidtoryBuilder();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget hidtoryBuilder() {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        switch (state) {
          case HistoryLoading():
            return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
          case HistorySuccess():
            return SliverToBoxAdapter(child: gridView(context, "Tarix", state.anime));
          default:
            return SliverFillRemaining(child: Center(child: Text("Animelarni qidiring")));
        }
      },
    );
  }

  Widget gridView(
    BuildContext context,
    String title,
    List<AnimeEntity> animes, [
    bool? isFromHistory,
  ]) {
    return Column(
      crossAxisAlignment: animes.isNotEmpty ? .start : .center,
      spacing: 7,
      children: [
        Text(title, style: context.textTheme.headlineLarge),
        GridView.builder(
          shrinkWrap: true,
          itemCount: animes.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: AnimeCard.aspectRatio,
          ),
          itemBuilder: (context, index) {
            return Stack(
              alignment: AlignmentGeometry.topLeft,
              children: [
                AnimeCard(anime: animes.elementAt(index)),
                Positioned(
                  top: 4,
                  left: 4,
                  child: IconButton(
                    mouseCursor: SystemMouseCursors.click,
                    color: context.appColors.errorContainer,
                    onPressed: () => context.read<HistoryBloc>().add(
                      DeleteFromHistory(animes.elementAt(index).id),
                    ),
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
