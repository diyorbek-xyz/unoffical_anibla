import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/utils.dart';
import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_bloc.dart';
import 'package:application/features/animes/presentation/bloc/anime/anime_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeInfosMenu extends StatelessWidget {
  const AnimeInfosMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey("infos"),
      slivers: [
        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        SliverToBoxAdapter(
          child: BlocBuilder<AnimeBloc, AnimeState>(
            builder: (context, state) {
              switch (state) {
                case AnimeFilure():
                  return Text(state.message);
                case AnimeLoading():
                case AnimeSuccess():
                  final isLoading = state is! AnimeSuccess;
                  final fake = AnimeMapper.modelToEntity(null);
                  final anime = isLoading ? fake : state.anime;
                  return Container(
                    padding: EdgeInsets.all(10),
                    alignment: AlignmentGeometry.center,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text("Anime haqida ma'lumot", style: context.textTheme.titleLarge),
                          Text(
                            !isLoading ? anime.description.uz : lorem(),
                            style: context.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 5),
                          Text("Janrlar", style: context.textTheme.titleLarge),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: anime.genres
                                .map(
                                  (e) => OutlinedButton(
                                    style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadiusGeometry.circular(7),
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
                          Text("Kategoriya", style: context.textTheme.titleLarge),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: anime.categories
                                .map(
                                  (e) => FilledButton(
                                    style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadiusGeometry.circular(7),
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
                default:
                  return Text("Nimadur xato ketti");
              }
            },
          ),
        ),
      ],
    );
  }
}
