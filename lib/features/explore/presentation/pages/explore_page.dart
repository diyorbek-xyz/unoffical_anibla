import 'package:application/features/explore/presentation/bloc/genre/genre_bloc.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_event.dart';
import 'package:application/features/explore/presentation/bloc/history/history_bloc.dart';
import 'package:application/features/explore/presentation/bloc/history/history_event.dart';
import 'package:application/features/explore/presentation/bloc/search/search_bloc.dart';
import 'package:application/features/explore/presentation/bloc/search/search_event.dart';
import 'package:application/features/explore/presentation/pages/genres_page.dart';
import 'package:application/features/explore/presentation/pages/search_page.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GenreBloc>()..add(GetGenres())),
        BlocProvider(create: (context) => sl<HistoryBloc>()..add(GetHistory())),
        BlocProvider(create: (context) => sl<SearchBloc>()),
      ],
      child: SafeArea(top: true, child: main()),
    );
  }

  final searchController = SearchController();
  void submitSearch(String value, BuildContext context) {
    context.read<SearchBloc>().add(SearchAnime.fromSearch(value));
    if (_tabController.index != 0) {
      _tabController.animateTo(0);
    }
  }

  void clearSearch(BuildContext context) {
    searchController.clear();
    context.read<SearchBloc>().add(SearchAnime());
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget main() {
    return NestedScrollView(
      headerSliverBuilder: (context, _) => [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            collapsedHeight: kToolbarHeight + 20,
            pinned: true,
            flexibleSpace: Container(
              padding: EdgeInsetsGeometry.all(20),
              alignment: AlignmentGeometry.topCenter,
              child: SearchBar(
                controller: searchController,
                onChanged: (value) {
                  if (value.isEmpty) clearSearch(context);
                },
                onSubmitted: (value) => submitSearch(value, context),
                constraints: BoxConstraints(maxWidth: 700, minHeight: kToolbarHeight),
                leading: Padding(padding: EdgeInsetsGeometry.all(10), child: Icon(Icons.search)),
                trailing: [
                  IconButton(onPressed: () => clearSearch(context), icon: Icon(Icons.clear)),
                ],
              ),
            ),
            bottom: TabBar(
              tabAlignment: TabAlignment.center,
              controller: _tabController,
              dividerHeight: 0,
              isScrollable: true,
              tabs: [
                Tab(text: "Qidiruv"),
                Tab(text: "Kategoriyalar"),
                Tab(text: "Janrlar"),
              ],
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: [
          SearchPage(),
          Text("hello"),
          GenresPage(controller: searchController, submit: submitSearch),
        ],
      ),
    );
  }
}
