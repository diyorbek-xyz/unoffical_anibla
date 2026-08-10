import 'package:application/features/explore/data/models/search_query.dart';
import 'package:application/features/explore/presentation/controller/explore_controller.dart';
import 'package:application/features/explore/presentation/pages/genres_page.dart';
import 'package:application/features/explore/presentation/pages/search_page.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with SingleTickerProviderStateMixin {
  final _exploreController = sl<ExploreController>();

  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Material(clipBehavior: .hardEdge, child: main()),
    );
  }

  final searchController = SearchController();
  void submitSearch(String value, BuildContext context) {
    _exploreController.searchAnime(SearchQuery.fromSearch(value));
    if (_tabController.index != 0) {
      _tabController.animateTo(0);
    }
  }

  void clearSearch(BuildContext context) {
    searchController.clear();
    _exploreController.searchAnime(SearchQuery());
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
        SliverPersistentHeader(
          pinned: true,
          delegate: SearchBarDelegate(clear: clearSearch, controller: searchController, submit: submitSearch),
        ),
        SliverPersistentHeader(pinned: false, delegate: TabDelegate(_tabController)),
      ],
      body: TabBarView(
        controller: _tabController,
        physics: BouncingScrollPhysics(),
        children: [
          SearchPage(),
          Text("hello"),
          GenresPage(controller: searchController, submit: submitSearch),
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final SearchController controller;
  final void Function(String, BuildContext) submit;
  final void Function(BuildContext) clear;
  const SearchBarDelegate({required this.controller, required this.submit, required this.clear});

  @override
  Widget build(context, shrink, over) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    return Material(
      child: Container(
        padding: .symmetric(vertical: 4),
        height: 100,
        alignment: .bottomCenter,
        child: SearchBar(
          controller: controller,
          onChanged: (value) {
            if (value.isEmpty) clear(context);
          },
          onSubmitted: (value) => submit(value, context),
          constraints: BoxConstraints(maxWidth: 500, minHeight: 100),
          shape: !isMobile ? null : WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(0))),
          leading: Padding(padding: EdgeInsetsGeometry.all(10), child: Icon(Icons.search)),
          trailing: [IconButton(onPressed: () => clear(context), icon: Icon(Icons.clear))],
        ),
      ),
    );
  }

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
