import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/features/explore/presentation/bloc/search/search_bloc.dart';
import 'package:application/features/explore/presentation/bloc/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
      key: const PageStorageKey("results"),

      slivers: [
        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            switch (state) {
              case SearchLoading():
                return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
              case SearchFound():
                if (state.movies.isEmpty || state.series.isEmpty) {
                  return SliverFillRemaining(child: Center(child: Text("Anime topilmadi")));
                }
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 10,
                    children: [
                      if (state.movies.isNotEmpty) gridView(context, "Seriyalar", state.series),
                      if (state.series.isNotEmpty) gridView(context, "Filmlar", state.movies),
                    ],
                  ),
                );
              default:
                return SliverFillRemaining(child: Center(child: Text("state")));
            }
          },
        ),
      ],
    );
  }

  Widget gridView(BuildContext context, String title, List<AnimeEntity> animes) {
    return Column(
      crossAxisAlignment: animes.isNotEmpty ? .start : .center,
      spacing: 7,
      children: [
        Text(title, style: context.textTheme.headlineLarge),
        Wrap(spacing: 5, children: animes.map((e) => AnimeCard(anime: e)).toList()),
      ],
    );
  }
}
