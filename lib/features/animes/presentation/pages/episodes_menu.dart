import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimeEpisodesMenu extends StatelessWidget {
  final AnimeEntity anime;
  const AnimeEpisodesMenu({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: CustomScrollView(
          scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
          key: const PageStorageKey("episodes"),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            BlocBuilder<EpisodeBloc, EpisodeState>(
              builder: (context, state) {
                switch (state) {
                  case EpisodeLoading():
                  case EpisodeSuccess():
                    final isLoading = state is! EpisodeSuccess;
                    final fake = List.generate(10, (index) => EpisodeMapper.modelToEntity(null));
                    final episodes = isLoading ? fake : state.episodes;
                    return Skeletonizer.sliver(enabled: isLoading, child: list(episodes, context));
                  case EpisodeFailure():
                    return SliverFillRemaining(child: Center(child: Text(state.message)));
                  default:
                    return SliverFillRemaining(child: Text("Nimadur xato ketti"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget list(List<EpisodeEntity> episodes, BuildContext context) {
    return SliverGrid.extent(
      maxCrossAxisExtent: 100,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: episodes
          .map(
            (e) => InkWell(
              onTap: () {},
              hoverColor: context.appColors.primaryContainer.withAlpha(70),
              splashColor: context.appColors.primaryContainer.withAlpha(70),
              focusColor: context.appColors.primaryContainer.withAlpha(70),
              highlightColor: context.appColors.primaryContainer.withAlpha(70),
              borderRadius: BorderRadius.circular(16),
              mouseCursor: SystemMouseCursors.click,
              child: Align(
                alignment: AlignmentGeometry.center,
                child: Text("${e.episodeNumber}-qism"),
              ),
            ),
          )
          .toList(),
    );
  }
}
