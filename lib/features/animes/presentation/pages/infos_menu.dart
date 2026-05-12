import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeInfosMenu extends StatelessWidget {
  const AnimeInfosMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
      key: const PageStorageKey("infos"),
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverToBoxAdapter(
          child: LayoutBuilder(
            builder: (context, constrained) {
              return Responsive(
                constraints: constrained,
                child: BlocBuilder<AnimeBloc, AnimeState>(
                  builder: (context, state) {
                    final responsive = Responsive.of(context);
                    final isLoading = state is! AnimeSuccess;
                    final fake = AnimeMapper.modelToEntity(null);
                    final anime = isLoading ? fake : state.anime;
                    final titleStyle = responsive.isMobile
                        ? context.textTheme.titleMedium
                        : context.textTheme.titleLarge;
                    final bodyStyle = responsive.isMobile
                        ? context.textTheme.bodySmall
                        : context.textTheme.bodyLarge;
                    return Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentGeometry.center,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 1000),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text("Anime haqida ma'lumot", style: titleStyle),
                            Text(
                              !isLoading ? anime.description.uz : lorem(),
                              style: bodyStyle,
                            ),
                            SizedBox(height: 5),
                            Text("Janrlar", style: titleStyle),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: anime.genres
                                  .map(
                                    (e) => OutlinedButton(
                                      style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  7,
                                                ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(e.title.uz),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SizedBox(height: 5),
                            Text("Kategoriya", style: titleStyle),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: anime.categories
                                  .map(
                                    (e) => FilledButton(
                                      style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  7,
                                                ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(e['name']['uz']),
                                    ),
                                  )
                                  .toList()
                                  .cast<Widget>(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
