import 'package:application/features/anibla/data/models/request/search_request.dart';
import 'package:application/features/anibla/presentation/controllers/explore_controller.dart';
import 'package:application/features/anibla/presentation/menus/explore/categories_menu.dart';
import 'package:application/features/anibla/presentation/menus/explore/genres_menu.dart';
import 'package:application/features/anibla/presentation/menus/explore/search_menu.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with SingleTickerProviderStateMixin {
  late final _exploreController = sl<ExploreController>();
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: true,
    child: Material(
      clipBehavior: .hardEdge,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SearchBarDelegate(clear: clearSearch, controller: searchController, submit: submitSearch),
          ),
          SliverPersistentHeader(pinned: false, delegate: TabDelegate(_tabController)),
        ],
        body: TabBarView(
          controller: _tabController,
          physics: BouncingScrollPhysics(),
          children: [
            SearchMenu(controller: searchController, submit: submitSearch),
            CategoriesMenu(controller: searchController, submit: submitSearch),
            GenresMenu(controller: searchController, submit: submitSearch),
          ],
        ),
      ),
    ),
  );

  final searchController = SearchController();

  void submitSearch(String value, BuildContext context) {
    _exploreController.searchAnime(SearchRequest.fromSearch(value));
    if (_tabController.index != 0) {
      _tabController.animateTo(0);
    }
  }

  void clearSearch(BuildContext context) {
    searchController.clear();
    _exploreController.searchAnime(SearchRequest());
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
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final SearchController controller;
  final void Function(String, BuildContext) submit;
  final void Function(BuildContext) clear;
  const SearchBarDelegate({required this.controller, required this.submit, required this.clear});

  @override
  Widget build(context, shrink, over) => Material(
    child: Container(
      padding: .all(4),
      height: 100,
      alignment: .bottomCenter,
      child: SearchBar(
        controller: controller,
        onChanged: (value) {
          if (value.isEmpty) clear(context);
        },
        onSubmitted: (value) => submit(value, context),
        constraints: BoxConstraints(maxWidth: 500, minHeight: 100),
        leading: Padding(padding: EdgeInsetsGeometry.all(10), child: Icon(Icons.search)),
        trailing: [IconButton(onPressed: () => clear(context), icon: Icon(Icons.clear))],
      ),
    ),
  );

  @override
  double get maxExtent => 70;
  @override
  double get minExtent => 60;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate old) => false;
}

class TabDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  TabDelegate(this.controller);

  @override
  Widget build(context, shrink, over) => Material(
    child: TabBar(
      tabAlignment: TabAlignment.center,
      controller: controller,
      dividerHeight: 0,
      isScrollable: true,
      tabs: [
        Tab(text: "Qidiruv"),
        Tab(text: "Kategoriyalar"),
        Tab(text: "Janrlar"),
      ],
    ),
  );
  @override
  double get maxExtent => 48;
  @override
  double get minExtent => 48;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate old) => false;
}
