import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:application/features/explore/domain/entities/genre_entity.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_bloc.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_event.dart';
import 'package:application/features/explore/presentation/bloc/genre/genre_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenresPage extends StatelessWidget {
  final SearchController controller;
  final Function(String value, BuildContext context) submit;
  const GenresPage({super.key, required this.controller, required this.submit});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
      key: const PageStorageKey("genres"),
      slivers: [
        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        BlocBuilder<GenreBloc, GenreState>(
          builder: (context, state) {
            switch (state) {
              case GenreLoading():
                return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
              case GenreFailed():
                return SliverFillRemaining(
                  child: ErrorBuilder(
                    message: state.message,
                    refresh: () => context.read<GenreBloc>().add(GetGenres()),
                  ),
                );
              case GenresFullSuccess():
                return SliverFillRemaining(
                  child: Padding(
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
                          children: state.data.map((e) => genreItem(context, e)).toList(),
                        ),
                      ),
                    ),
                  ),
                );
              default:
                return SliverFillRemaining(child: Text("Janrlar"));
            }
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
    );
  }
}
