import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_bloc.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_event.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_state.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<GenreBloc>()..add(GetGenres()))],
      child: Builder(builder: main),
    );
  }

  DefaultTabController main(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (_, _) => [
          SliverAppBar(
            centerTitle: true,
            title: SearchBar(
              leading: Padding(padding: EdgeInsetsGeometry.all(10), child: Icon(Icons.search)),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.center,
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(text: "Tarix"),
                Tab(text: "Kategoriyalar"),
                Tab(text: "Janrlar"),
              ],
            ),
          ),
        ],
        body: TabBarView(children: [Text("Tarix"), Text("hello"), genresBuilder(context)]),
      ),
    );
  }

  Widget genresBuilder(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        if (state is GenreLoading) {
          return Center(child: CircularProgressIndicator());
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
