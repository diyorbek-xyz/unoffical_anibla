import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_bloc.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_event.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_state.dart';
import 'package:application/features/explore/presentation/bloc/search/search_bloc.dart';
import 'package:application/features/explore/presentation/bloc/search/search_event.dart';
import 'package:application/features/explore/presentation/pages/search_page.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GenreBloc>()..add(GetGenres())),
        BlocProvider(create: (context) => sl<SearchBloc>()),
      ],
      child: Builder(builder: main),
    );
  }

  DefaultTabController main(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              collapsedHeight: kToolbarHeight + 20,
              pinned: true,
              flexibleSpace: Container(
                padding: EdgeInsetsGeometry.only(top: 20),
                alignment: AlignmentGeometry.topCenter,
                child: SearchBar(
                  onSubmitted: (value) => context.read<SearchBloc>().add(SearchAnime(value)),
                  constraints: BoxConstraints(maxWidth: 700, minHeight: kToolbarHeight),
                  leading: Padding(padding: EdgeInsetsGeometry.all(10), child: Icon(Icons.search)),
                ),
              ),
              bottom: TabBar(
                tabAlignment: TabAlignment.center,
                dividerHeight: 0,
                isScrollable: true,
                tabs: [
                  Tab(text: "Tarix"),
                  Tab(text: "Kategoriyalar"),
                  Tab(text: "Janrlar"),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(children: [SearchPage(), Text("hello"), genresBuilder(context)]),
      ),
    );
  }

  Widget genresBuilder(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        if (state is GenreLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is GenreFailed) {
          return ErrorBuilder(
            message: state.message,
            refresh: () => context.read<GenreBloc>().add(GetGenres()),
          );
        }
        if (state is GenresFullSuccess) {
          return Padding(
            padding: EdgeInsetsGeometry.all(5),
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(12),
              child: RefreshIndicator.adaptive(
                onRefresh: () async => context.read<GenreBloc>().add(GetGenres()),
                child: GridView.extent(
                  physics: NeverScrollableScrollPhysics(),
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 3 / 1,
                  shrinkWrap: true,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  children: state.data
                      .map(
                        (e) => InkWell(
                          onTap: () {},
                          focusColor: context.appColors.primaryContainer.withAlpha(20),
                          hoverColor: context.appColors.primaryContainer.withAlpha(20),
                          splashColor: context.appColors.primaryContainer.withAlpha(20),
                          highlightColor: context.appColors.primaryContainer.withAlpha(20),
                          mouseCursor: SystemMouseCursors.click,
                          child: Ink(
                            decoration: BoxDecoration(
                              color: context.appColors.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: AlignmentGeometry.center,
                              child: Text(
                                e.title.uz,
                                style: TextStyle(color: context.appColors.onPrimary, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        }
        return Text("data");
      },
    );
  }
}
