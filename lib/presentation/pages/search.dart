import 'package:application/core/constants/theme.dart';
import 'package:application/data/models/enums/anime.dart';
import 'package:application/domain/entities/animes/anime_entity.dart';
import 'package:application/injection_container.dart';
import 'package:application/presentation/bloc/category/category_bloc.dart';
import 'package:application/presentation/bloc/category/category_event.dart';
import 'package:application/presentation/bloc/category/category_state.dart';
import 'package:application/presentation/bloc/search/search_bloc.dart';
import 'package:application/presentation/bloc/search/search_event.dart';
import 'package:application/presentation/bloc/search/search_state.dart';
import 'package:application/presentation/model/anime_ui.dart';
import 'package:application/presentation/model/category_ui.dart';
import 'package:application/presentation/widgets/ui/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isMovieFirst = false;

  final _controller = SearchController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SearchBloc>()),
        BlocProvider(create: (_) => sl<CategoriesListBloc>()..add(GetCategoriesListEvent())),
      ],
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            SizedBox(height: 16),
            _searchBuilder(),
            SizedBox(height: 16),
            TabBar(
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              indicator: BoxDecoration(shape: BoxShape.rectangle, color: Theme.of(context).colorScheme.primary),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 0,
              labelColor: Theme.of(context).colorScheme.onPrimary,
              dividerColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                Tab(text: "Seriyalar"),
                Tab(text: "Filmlar"),
                Tab(text: "Janrlar"),
                Tab(text: "Kategoriyalar"),
                Tab(text: "Kalendar"),
              ],
            ),
            Expanded(
              child: TabBarView(
                clipBehavior: Clip.hardEdge,
                children: [
                  _resultsBuilder(AnimeType.serie),
                  _resultsBuilder(AnimeType.movie),
                  _categoriesBuilder(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBuilder() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SearchBar(
            enabled: state is! SearchLoadingState,
            leading: Padding(padding: EdgeInsets.all(8), child: Icon(Icons.search)),
            constraints: BoxConstraints(maxWidth: 800, minWidth: 100, minHeight: 55, maxHeight: 80),
            controller: _controller,
            onSubmitted: (value) {
              context.read<SearchBloc>().add(SearchAnimes(query: value, limit: 50, page: 1));
            },
            hintText: "Animelarni qidirish",
            trailing: [
              IconButton(onPressed: () {}, tooltip: "Rasm orqali qidirish (Beta)", icon: Icon(Icons.file_copy)),
              SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  context.read<SearchBloc>().add(SearchClear());
                  _controller.clear();
                },
                tooltip: "Tozalash",
                icon: Icon(Icons.clear),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _resultsBuilder(AnimeType type) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchEmptyState) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: 500),
            child: Center(child: Text("Animelar topilmadi", style: TextStyle(fontSize: 20))),
          );
        }
        if (state is SearchInitialState) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: 500),
            child: Center(child: Text("Animelarni qidirish", style: TextStyle(fontSize: 20))),
          );
        }
        final seriesResult = state.series ?? List.generate(6, (index) => AnimeUiModel.fromEntity(AnimeEntity()));
        final moviesResult = state.movies ?? List.generate(6, (index) => AnimeUiModel.fromEntity(AnimeEntity()));
        final result = switch (type) {
          AnimeType.serie => seriesResult,
          AnimeType.movie => moviesResult,
        };
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Skeletonizer(
              effect: pulseEffect,
              enabled: state is SearchLoadingState,
              child: Material(
                clipBehavior: Clip.hardEdge,
                child: ResponsiveGridList(
                  minItemWidth: 180,
                  minItemsPerRow: 2,
                  maxItemsPerRow: 6,
                  verticalGridSpacing: 10,
                  horizontalGridSpacing: 0,
                  listViewBuilderOptions: ListViewBuilderOptions(physics: const NeverScrollableScrollPhysics(), shrinkWrap: true),
                  children: result.map((anime) => WidgetAnimeCard(anime: anime)).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _categoriesBuilder() {
    return BlocBuilder<CategoriesListBloc, CategoriesListState>(
      builder: (context, state) {
        if (state is CategoriesListLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesListErrorState) {
          return Column(
            children: [
              Text("Xatolik yuz berdi: ${state.exception?.response}"),
              IconButton(
                onPressed: () {
                  context.read<CategoriesListBloc>().add(GetCategoriesListEvent());
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          );
        }
        if (state is CategoriesListSuccessState) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.categories?.map(_categoryCard).toList() ?? [],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _categoryCard(CategoryUiModel category) {
    return InkWell(
      onTap: () {},
      hoverColor: primaryTint,
      splashColor: primaryTint,
      highlightColor: primaryTint,
      child: Ink(width: 100, height: 100, child: Text(category.name.uz)),
    );
  }
}
